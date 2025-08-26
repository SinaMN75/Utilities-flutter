import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum ChartLegendPosition { top, bottom, left, right }

enum ChartOverflowMode { wrap, scroll, none }

extension ChartLegendPositionExtension on ChartLegendPosition {
  LegendPosition toSyncfusion() {
    switch (this) {
      case ChartLegendPosition.top:
        return LegendPosition.top;
      case ChartLegendPosition.bottom:
        return LegendPosition.bottom;
      case ChartLegendPosition.left:
        return LegendPosition.left;
      case ChartLegendPosition.right:
        return LegendPosition.right;
    }
  }
}

extension ChartOverflowModeExtension on ChartOverflowMode {
  LegendItemOverflowMode toSyncfusion() {
    switch (this) {
      case ChartOverflowMode.wrap:
        return LegendItemOverflowMode.wrap;
      case ChartOverflowMode.scroll:
        return LegendItemOverflowMode.scroll;
      case ChartOverflowMode.none:
        return LegendItemOverflowMode.none;
    }
  }
}

class ChartData {
  ChartData({
    required this.xValue,
    required this.yValue,
    this.color,
    this.label,
    this.secondYValue,
    this.thirdYValue,
    this.size,
    this.open,
    this.close,
    this.low,
    this.high,
    this.volume,
    this.boxValues,
  });

  final dynamic xValue;
  final num yValue;
  final Color? color;
  final String? label;
  final num? secondYValue;
  final num? thirdYValue;
  final num? size;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
  final List<num>? boxValues; // For BoxAndWhiskerChart
}

class UDoughnutChart extends StatelessWidget {
  const UDoughnutChart({
    required this.data,
    this.centerWidget,
    this.legendPosition = ChartLegendPosition.left,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.radius = '100%',
    this.innerRadius = '50%',
    this.explode = true,
    this.animationDuration = 1000,
    this.animationDelay = 1000,
    this.dataLabelSettings = const DataLabelSettings(isVisible: true),
    super.key,
  });

  final List<ChartData> data;
  final Widget? centerWidget;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final String radius;
  final String innerRadius;
  final bool explode;
  final double animationDuration;
  final double animationDelay;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
        height: "100",
      ),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(widget: centerWidget ?? const SizedBox()),
      ],
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      series: <DoughnutSeries<ChartData, String>>[
        DoughnutSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          radius: radius,
          innerRadius: innerRadius,
          explode: explode,
          animationDuration: animationDuration,
          animationDelay: animationDelay,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UPieChart extends StatelessWidget {
  const UPieChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.left,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.radius = '100%',
    this.animationDuration = 1000,
    this.animationDelay = 1000,
    this.dataLabelSettings = const DataLabelSettings(isVisible: true),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final String radius;
  final double animationDuration;
  final double animationDelay;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
        height: "100",
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      series: <PieSeries<ChartData, String>>[
        PieSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          radius: radius,
          animationDuration: animationDuration,
          animationDelay: animationDelay,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class URadialBarChart extends StatelessWidget {
  const URadialBarChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.left,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.radius = '100%',
    this.innerRadius = '50%',
    this.animationDuration = 1000,
    this.trackColor = Colors.grey,
    this.trackOpacity = 0.3,
    this.dataLabelSettings = const DataLabelSettings(isVisible: true),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final String radius;
  final String innerRadius;
  final double animationDuration;
  final Color trackColor;
  final double trackOpacity;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
        height: "100",
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      series: <RadialBarSeries<ChartData, String>>[
        RadialBarSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          radius: radius,
          innerRadius: innerRadius,
          animationDuration: animationDuration,
          trackColor: trackColor,
          trackOpacity: trackOpacity,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class ULineChart extends StatelessWidget {
  const ULineChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <LineSeries<ChartData, String>>[
        LineSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UColumnChart extends StatelessWidget {
  const UColumnChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.spacing = 0.2,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double spacing;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <ColumnSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          spacing: spacing,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UBarChart extends StatelessWidget {
  const UBarChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.spacing = 0.2,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double spacing;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <BarSeries<ChartData, String>>[
        BarSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          spacing: spacing,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UAreaChart extends StatelessWidget {
  const UAreaChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.opacity = 0.7,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double opacity;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <AreaSeries<ChartData, String>>[
        AreaSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          opacity: opacity,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UStackedBarChart extends StatelessWidget {
  const UStackedBarChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.spacing = 0.2,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double spacing;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <StackedBarSeries<ChartData, String>>[
        StackedBarSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          spacing: spacing,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UStackedColumnChart extends StatelessWidget {
  const UStackedColumnChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.spacing = 0.2,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double spacing;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <StackedColumnSeries<ChartData, String>>[
        StackedColumnSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          spacing: spacing,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class URangeColumnChart extends StatelessWidget {
  const URangeColumnChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.spacing = 0.2,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final double spacing;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <RangeColumnSeries<ChartData, String>>[
        RangeColumnSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          spacing: spacing,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          highValueMapper: (ChartData data, _) => data.high,
          lowValueMapper: (ChartData data, _) => data.low,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.high.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class USplineChart extends StatelessWidget {
  const USplineChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <SplineSeries<ChartData, String>>[
        SplineSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UStepLineChart extends StatelessWidget {
  const UStepLineChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <StepLineSeries<ChartData, String>>[
        StepLineSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UScatterChart extends StatelessWidget {
  const UScatterChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <ScatterSeries<ChartData, String>>[
        ScatterSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UBubbleChart extends StatelessWidget {
  const UBubbleChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <BubbleSeries<ChartData, String>>[
        BubbleSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          sizeValueMapper: (ChartData data, _) => data.size,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UHiloChart extends StatelessWidget {
  const UHiloChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <HiloSeries<ChartData, String>>[
        HiloSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          highValueMapper: (ChartData data, _) => data.high,
          lowValueMapper: (ChartData data, _) => data.low,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.high.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UHiloOpenCloseChart extends StatelessWidget {
  const UHiloOpenCloseChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <HiloOpenCloseSeries<ChartData, String>>[
        HiloOpenCloseSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          openValueMapper: (ChartData data, _) => data.open,
          closeValueMapper: (ChartData data, _) => data.close,
          highValueMapper: (ChartData data, _) => data.high,
          lowValueMapper: (ChartData data, _) => data.low,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.close.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UCandlestickChart extends StatelessWidget {
  const UCandlestickChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <CandleSeries<ChartData, String>>[
        CandleSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          openValueMapper: (ChartData data, _) => data.open,
          closeValueMapper: (ChartData data, _) => data.close,
          highValueMapper: (ChartData data, _) => data.high,
          lowValueMapper: (ChartData data, _) => data.low,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.close.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UBoxAndWhiskerChart extends StatelessWidget {
  const UBoxAndWhiskerChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <BoxAndWhiskerSeries<ChartData, String>>[
        BoxAndWhiskerSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.boxValues ?? <num?>[data.yValue],
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UHistogramChart extends StatelessWidget {
  const UHistogramChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const NumericAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final NumericAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <HistogramSeries<ChartData, num>>[
        HistogramSeries<ChartData, num>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UWaterfallChart extends StatelessWidget {
  const UWaterfallChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.top,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.animationDuration = 1000,
    this.xAxis = const CategoryAxis(),
    this.yAxis = const NumericAxis(),
    this.dataLabelSettings = const DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final double animationDuration;
  final CategoryAxis xAxis;
  final NumericAxis yAxis;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      primaryXAxis: xAxis,
      primaryYAxis: yAxis,
      series: <WaterfallSeries<ChartData, String>>[
        WaterfallSeries<ChartData, String>(
          dataSource: data,
          pointColorMapper: (ChartData data, _) => data.color,
          animationDuration: animationDuration,
          xValueMapper: (ChartData data, _) => data.xValue.toString(),
          yValueMapper: (ChartData data, _) => data.yValue,
          dataLabelMapper: (ChartData data, _) => data.label ?? data.yValue.toString(),
          dataLabelSettings: dataLabelSettings,
        ),
      ],
    );
  }
}

class UPyramidChart extends StatelessWidget {
  const UPyramidChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.left,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.height = '100%',
    this.width = '100%',
    this.animationDuration = 1000,
    this.dataLabelSettings = const DataLabelSettings(isVisible: true),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final String height;
  final String width;
  final double animationDuration;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfPyramidChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
        height: "100",
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      series: PyramidSeries<ChartData, String>(
        dataSource: data,
        pointColorMapper: (ChartData data, _) => data.color,
        height: height,
        width: width,
        animationDuration: animationDuration,
        xValueMapper: (ChartData data, _) => data.xValue.toString(),
        yValueMapper: (ChartData data, _) => data.yValue,
        dataLabelSettings: dataLabelSettings,
      ),
    );
  }
}

class UFunnelChart extends StatelessWidget {
  const UFunnelChart({
    required this.data,
    this.legendPosition = ChartLegendPosition.left,
    this.overflowMode = ChartOverflowMode.wrap,
    this.showLegend = true,
    this.enableTooltip = true,
    this.height = '100%',
    this.width = '100%',
    this.animationDuration = 1000,
    this.dataLabelSettings = const DataLabelSettings(isVisible: true),
    super.key,
  });

  final List<ChartData> data;
  final ChartLegendPosition legendPosition;
  final ChartOverflowMode overflowMode;
  final bool showLegend;
  final bool enableTooltip;
  final String height;
  final String width;
  final double animationDuration;
  final DataLabelSettings dataLabelSettings;

  @override
  Widget build(BuildContext context) {
    return SfFunnelChart(
      legend: Legend(
        isVisible: showLegend,
        overflowMode: overflowMode.toSyncfusion(),
        position: legendPosition.toSyncfusion(),
        height: "100",
      ),
      tooltipBehavior: TooltipBehavior(enable: enableTooltip),
      series: FunnelSeries<ChartData, String>(
        dataSource: data,
        pointColorMapper: (ChartData data, _) => data.color,
        height: height,
        width: width,
        animationDuration: animationDuration,
        xValueMapper: (ChartData data, _) => data.xValue.toString(),
        yValueMapper: (ChartData data, _) => data.yValue,
        dataLabelSettings: dataLabelSettings,
      ),
    );
  }
}

class DemoCharts extends StatelessWidget {
  const DemoCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> sampleData = <ChartData>[
      ChartData(
        xValue: 'Jan',
        yValue: 10,
        color: Colors.blue,
        label: '10',
        size: 5,
        open: 8,
        close: 12,
        high: 15,
        low: 7,
        boxValues: <num>[7, 9, 10, 11, 15],
      ),
      ChartData(
        xValue: 'Feb',
        yValue: 15,
        color: Colors.red,
        label: '15',
        size: 7,
        open: 12,
        close: 16,
        high: 18,
        low: 10,
        boxValues: <num>[10, 12, 15, 16, 18],
      ),
      ChartData(
        xValue: 'Mar',
        yValue: 20,
        color: Colors.green,
        label: '20',
        size: 3,
        open: 18,
        close: 22,
        high: 25,
        low: 15,
        boxValues: <num>[15, 18, 20, 21, 25],
      ),
      ChartData(
        xValue: 'Apr',
        yValue: 25,
        color: Colors.orange,
        label: '25',
        size: 6,
        open: 22,
        close: 27,
        high: 30,
        low: 20,
        boxValues: <num>[20, 22, 25, 26, 30],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chart Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Doughnut Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UDoughnutChart(data: sampleData, centerWidget: const Text('Total'))),
            const SizedBox(height: 20),
            const Text('Pie Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UPieChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Radial Bar Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: URadialBarChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Line Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: ULineChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Column Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UColumnChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Bar Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UBarChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Area Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UAreaChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Stacked Bar Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UStackedBarChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Stacked Column Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UStackedColumnChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Range Column Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: URangeColumnChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Spline Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: USplineChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Step Line Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UStepLineChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Scatter Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UScatterChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Bubble Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UBubbleChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Hilo Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UHiloChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Hilo Open Close Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UHiloOpenCloseChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Candlestick Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UCandlestickChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Box and Whisker Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UBoxAndWhiskerChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Histogram Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UHistogramChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Waterfall Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UWaterfallChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Pyramid Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UPyramidChart(data: sampleData)),
            const SizedBox(height: 20),
            const Text('Funnel Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: UFunnelChart(data: sampleData)),
          ],
        ),
      ),
    );
  }
}

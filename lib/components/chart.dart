part of 'components.dart';

class CartesianChartData {
  CartesianChartData({
    this.x,
    this.y,
    this.xValue,
    this.yValue,
    this.secondSeriesYValue,
    this.thirdSeriesYValue,
    this.pointColor,
    this.size,
    this.text,
    this.open,
    this.close,
    this.low,
    this.high,
    this.volume,
  });

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}

class DoughnutChartData {
  DoughnutChartData(this.title, this.value, {this.valueText});

  final String title;
  final double value;
  final String? valueText;
}

SfCircularChart doughnutChart({
  required final List<DoughnutChartData> data,
  final Widget? center,
}) =>
    SfCircularChart(
      legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll, position: LegendPosition.left),
      annotations: <CircularChartAnnotation>[CircularChartAnnotation(widget: center)],
      series: <DoughnutSeries<DoughnutChartData, String>>[
        DoughnutSeries<DoughnutChartData, String>(
          radius: '100%',
          dataSource: data,
          explode: true,
          animationDuration: 1000,
          enableTooltip: true,
          animationDelay: 1000,
          xValueMapper: (final DoughnutChartData data, final _) => data.title,
          yValueMapper: (final DoughnutChartData data, final _) => data.value,
          dataLabelMapper: (final DoughnutChartData data, final _) => data.valueText ?? data.title,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );

SfCartesianChart cartesianChart({required final List<CartesianChartData> data}) => SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: data.reduce((final CartesianChartData x, final CartesianChartData y) => x.yValue! > y.yValue! ? x : y).yValue!.toDouble(),
        isVisible: true,
        labelFormat: '{value}',
      ),
      series: <ColumnSeries<CartesianChartData, String>>[
        ColumnSeries<CartesianChartData, String>(
          dataSource: data,
          xValueMapper: (final CartesianChartData data, final _) => data.xValue as String,
          yValueMapper: (final CartesianChartData data, final _) => data.yValue,
          pointColorMapper: (final CartesianChartData data, final _) => data.pointColor,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          width: 1,
        ),
      ],
    );

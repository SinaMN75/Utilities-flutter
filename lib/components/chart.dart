part of 'components.dart';

class UDoughnutChart extends StatelessWidget {
  const UDoughnutChart({
    required this.data,
    this.center,
    this.legendPosition = LegendPosition.left,
    this.overflowMode = LegendItemOverflowMode.wrap,
    super.key,
  });

  final List<DoughnutChartData> data;
  final LegendPosition legendPosition;
  final LegendItemOverflowMode overflowMode;
  final Widget? center;

  @override
  Widget build(BuildContext context) => SfCircularChart(
        legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, position: legendPosition, height: "100"),
        annotations: <CircularChartAnnotation>[CircularChartAnnotation(widget: center ?? SizedBox())],
        series: <DoughnutSeries<DoughnutChartData, String>>[
          DoughnutSeries<DoughnutChartData, String>(
            pointColorMapper: (final DoughnutChartData data, final _) => data.color,
            radius: '100%',
            dataSource: data,
            explode: true,
            animationDuration: 1000,
            enableTooltip: true,
            animationDelay: 1000,
            xValueMapper: (final DoughnutChartData data, final _) => data.title,
            yValueMapper: (final DoughnutChartData data, final _) => data.value,
            dataLabelMapper: (final DoughnutChartData data, final _) => data.valueText ?? data.value.toString(),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      );
}

class UCartesianChart extends StatelessWidget {
  const UCartesianChart({super.key, required this.data, this.textStyle});

  final List<CartesianChartData> data;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(majorGridLines: const MajorGridLines(width: 0), labelStyle: textStyle),
        primaryYAxis: NumericAxis(
          labelStyle: textStyle,
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
            dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: textStyle),
            width: 1,
          ),
        ],
      );
}

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
  DoughnutChartData(this.title, this.value, {this.valueText, this.color});

  final String title;
  final double value;
  final String? valueText;
  final Color? color;
}

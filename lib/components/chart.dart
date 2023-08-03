part of 'components.dart';

class UtilitiesPieChartData {
  UtilitiesPieChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}

SfCircularChart doughnutChart({
  required final List<UtilitiesPieChartData> data,
  final Widget? center,
}) =>
    SfCircularChart(
      legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll, position: LegendPosition.left),
      annotations: <CircularChartAnnotation>[CircularChartAnnotation(widget: center)],
      series: <DoughnutSeries<UtilitiesPieChartData, String>>[
        DoughnutSeries<UtilitiesPieChartData, String>(
          radius: '100%',
          dataSource: data,
          explode: true,
          animationDuration: 1000,
          enableTooltip: true,
          animationDelay: 1000,
          xValueMapper: (final UtilitiesPieChartData data, final _) => data.x,
          yValueMapper: (final UtilitiesPieChartData data, final _) => data.y,
          dataLabelMapper: (final UtilitiesPieChartData data, final _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );

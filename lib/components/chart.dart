part of 'components.dart';

class UtilitiesPieChartData {
  UtilitiesPieChartData(this.title, this.value, this.valueText);

  final String title;
  final double value;
  final String valueText;
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
          xValueMapper: (final UtilitiesPieChartData data, final _) => data.title,
          yValueMapper: (final UtilitiesPieChartData data, final _) => data.value,
          dataLabelMapper: (final UtilitiesPieChartData data, final _) => data.valueText,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );

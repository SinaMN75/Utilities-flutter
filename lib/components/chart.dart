import "package:intl/intl.dart" as intl;
import "package:u/utilities.dart";

class UCartesianChart extends StatefulWidget {
  const UCartesianChart({
    required this.series,
    required this.primaryXAxisTitle,
    required this.primaryYAxisTitle,
    required this.title,
    this.numberFormat,
    super.key,
  });

  final String title;
  final String primaryXAxisTitle;
  final String primaryYAxisTitle;
  final intl.NumberFormat? numberFormat;
  final List<CartesianSeries<dynamic, dynamic>> series;

  @override
  State<UCartesianChart> createState() => _UCartesianChartState();
}

class _UCartesianChartState extends State<UCartesianChart> {
  @override
  Widget build(BuildContext context) => SfCartesianChart(
    title: ChartTitle(text: widget.title),
    legend: const Legend(isVisible: true),
    tooltipBehavior: TooltipBehavior(enable: true),
    primaryXAxis: CategoryAxis(title: AxisTitle(text: widget.primaryXAxisTitle)),
    primaryYAxis: NumericAxis(
      title: AxisTitle(text: widget.primaryYAxisTitle),
      numberFormat: widget.numberFormat,
    ),
    series: widget.series,
  );
}

class UCartesianChartSample extends StatelessWidget {
  const UCartesianChartSample({super.key});

  @override
  Widget build(BuildContext context) => UCartesianChart(
    primaryXAxisTitle: "ماه",
    primaryYAxisTitle: "مقدار",
    title: "گزارش پرداخت‌ها",
    series: <CartesianSeries<InvoiceChartDataResponse, String>>[
      ColumnSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalPaid,
        name: "مبالغ پرداخت شده",
        color: Colors.green,
      ),
      BubbleSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
      BarSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
      AreaSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
      ErrorBarSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
      FastLineSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
      WaterfallSeries<InvoiceChartDataResponse, String>(
        dataSource: const <InvoiceChartDataResponse>[],
        xValueMapper: (InvoiceChartDataResponse data, _) => data.month,
        yValueMapper: (InvoiceChartDataResponse data, _) => data.totalDebt,
        name: "مبالغ قابل پرداخت",
        color: Colors.blue,
      ),
    ],
  );
}

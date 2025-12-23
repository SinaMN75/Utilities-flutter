part of "../u_admin.dart";

class UAdminDashboardController extends UAdminBaseController {
  Timer? _timer;
  Rx<UMetricsResponse> metrics = UMetricsResponse().obs;
  late UDashboardResponse dashboard;

  final Rx<PageState> chartState = PageState.initial.obs;
  List<InvoiceChartDataResponse> chartData = <InvoiceChartDataResponse>[];

  void init() {
    read();
    startMetricsPolling();
    readInvoiceChartData();
  }

  void readInvoiceChartData() {
    chartState.loading();
    U.services.invoice.chartData(
      p: UBaseParams(),
      onOk: (UResponse<List<InvoiceChartDataResponse>> r) {
        chartData = r.result!;
        chartState.loaded();
      },
      onError: (UResponse<dynamic> r) {},
      onException: (String e) {},
    );
  }

  void startMetricsPolling() => _timer = Timer.periodic(
    const Duration(seconds: 10),
    (_) => U.services.dashboard.readSystemMetrics(
      onOk: (UMetricsResponse response) => metrics(response),
      onError: () {},
      onException: (String e) {},
    ),
  );

  void read() {
    state.loading();
    U.services.dashboard.read(
      onOk: (UDashboardResponse response) {
        dashboard = response;
        state.loaded();
      },
      onError: state.error,
      onException: (String e) => state.error(),
    );
  }

  void dispose() => _timer?.cancel();
}

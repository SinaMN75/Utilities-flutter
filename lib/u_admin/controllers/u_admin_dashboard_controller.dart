part of "../u_admin.dart";

class UAdminDashboardController extends UBaseController {
  Timer? _timer;
  Rx<UMetricsResponse> metrics = UMetricsResponse().obs;
  late UDashboardResponse dashboard;

  final Rx<PageState> chartState = PageState.initial.obs;

  void init() {
    read();
    startMetricsPolling();
    readInvoiceChartData();
  }

  void readInvoiceChartData() {
    chartState.loading();
  }

  void startMetricsPolling() => _timer = Timer.periodic(
    const Duration(seconds: 10),
    (_) => UServices.dashboard.readSystemMetrics(
      onOk: (UMetricsResponse response) => metrics(response),
      onError: () {},
      onException: (String e) {},
    ),
  );

  void read() {
    state.loading();
    UServices.dashboard.read(
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

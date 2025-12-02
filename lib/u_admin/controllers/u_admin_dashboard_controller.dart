part of "../u_admin.dart";

class UAdminDashboardController {
  void init() {
    read();
    startMetricsPolling();
  }

  final Rx<PageState> state = PageState.initial.obs;
  Timer? _timer;
  Rx<UMetricsResponse> metrics = UMetricsResponse().obs;
  late UDashboardResponse dashboard;

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
      onError: () => state.error(),
      onException: (String e) => state.error(),
    );
  }

  void dispose() => _timer?.cancel();
}

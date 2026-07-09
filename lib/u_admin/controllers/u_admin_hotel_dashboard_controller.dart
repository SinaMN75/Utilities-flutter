part of "../u_admin.dart";
// Business logic relocated from the u_admin app so it can be shared across projects.

class UAdminHotelDashboardController extends UBaseController {
  final Rxn<UPropertyDashboardResponse> report = Rxn<UPropertyDashboardResponse>();

  Future<void> init() => load();

  Future<void> load() async {
    state.loading();
    await UServices.dashboard.readPropertyDashboard(
      p: UDashboardRangeParams(),
      onOk: (UResponse<UPropertyDashboardResponse> r) {
        report.value = r.result;
        state.loaded();
      },
      onError: (_) => state.error(),
      onException: (String e) => state.error(),
    );
  }
}

part of "../u_admin.dart";

class UAdminLogsController extends UAdminBaseController {
  RxList<YearLog> logs = <YearLog>[].obs;

  RxInt selectedTabIndex = 0.obs;

  Future<void> fetchLogStructure() async {
    state.loading();
    UServices.dashboard.getLogStructure(
      onOk: (LogStructureResponse structure) {
        logs(structure.logs);
        state.loaded();
      },
      onError: () {
        state.error();
        UToast.error(message: U.s.failedToLoadLogStructure);
      },
      onException: (String e) {},
    );
  }

  Future<void> fetchLogContent(String logId, Function(String) onOk) async {
    ULoading.show();
    UServices.dashboard.getLogContent(
      logId: logId,
      onOk: (String contents) {
        onOk(contents);
        state.loaded();
        ULoading.dismiss();
      },
      onError: () {
        state.error();
        UToast.error(message: U.s.failedToLoadLogContent);
      },
      onException: (String e) {},
    );
  }
}

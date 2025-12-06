part of "../u_admin.dart";

class UAdminLogsController {
  Rx<PageState> state = PageState.initial.obs;
  RxList<YearLog> logs = <YearLog>[].obs;

  // RxList<LogContentResponse> logContents = <LogContentResponse>[].obs;
  RxInt selectedTabIndex = 0.obs;

  Future<void> fetchLogStructure() async {
    state.loading();
    U.services.dashboard.getLogStructure(
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

  Future<void> fetchLogContent(String logId, Function(List<LogContentResponse>) onOk) async {
    ULoading.show();
    U.services.dashboard.getLogContent(
      logId: logId,
      onOk: (List<LogContentResponse> contents) {
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

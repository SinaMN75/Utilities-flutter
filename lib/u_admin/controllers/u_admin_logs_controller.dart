part of "../u_admin.dart";

class UAdminLogsController {
  final UServices uServices;

  UAdminLogsController({required this.uServices});

  Rx<PageState> state = PageState.initial.obs;
  RxList<YearLog> logs = <YearLog>[].obs;

  // RxList<LogContentResponse> logContents = <LogContentResponse>[].obs;
  RxInt selectedTabIndex = 0.obs;

  Future<void> fetchLogStructure() async {
    state.loading();
    uServices.dashboard.getLogStructure(
      onOk: (LogStructureResponse structure) {
        logs(structure.logs);
        state.loaded();
      },
      onError: () {
        state.error();
        UNavigator.error(message: "Failed to load log structure");
      },
      onException: (String e) {},
    );
  }

  Future<void> fetchLogContent(String logId, Function(List<LogContentResponse>) onOk) async {
    ULoading.show();
    uServices.dashboard.getLogContent(
      logId: logId,
      onOk: (List<LogContentResponse> contents) {
        onOk(contents);
        state.loaded();
        ULoading.dismiss();
      },
      onError: () {
        state.error();
        UNavigator.error(message: "Failed to load log content");
      },
      onException: (String e) {},
    );
  }
}

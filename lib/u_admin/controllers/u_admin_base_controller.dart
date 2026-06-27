part of "../u_admin.dart";

abstract class UAdminBaseController {
  final Rx<PageState> state = PageState.initial.obs;

  int totalCount = 0;
  RxInt pageNumber = 1.obs;
  RxInt totalPages = 1.obs;
  int pageSize = 20;

  // Filter
  DateTime? fromCreatedAt;
  DateTime? toCreatedAt;
  DateTime? startDate;
  DateTime? endDate;

  bool orderByCreatedAt = false;
  bool orderByCreatedAtDesc = false;

  final TextEditingController controllerStartDate = TextEditingController();
  final TextEditingController controllerEndDate = TextEditingController();

  bool get isFa => ULocalStorage.getLocale() == "fa";

  void setTotalPages(int totalCount) => totalPages((totalCount / pageSize).ceil().clamp(1, 1 << 30));

  void firstPage() => pageNumber(1);

  void setListState({required bool isEmpty}) => isEmpty ? state.emptying() : state.loaded();

  void setError([String? message]) {
    state.error();
    if (message != null) UToast.error(message: message);
  }

  void reloadFirstPage(void Function() read) {
    firstPage();
    read();
  }

  void okCallback(String? message, void Function() reload) {
    UToast.snackBar(message: message ?? U.s.submitted);
    reload();
  }

  void errorCallBack(String? message, void Function() reload) {
    UToast.error(message: message ?? U.s.errorSubmittingForm);
    reload();
  }
}

part of "../u_admin.dart";

class UAdminBaseController {
  final Rx<PageState> state = PageState.initial.obs;

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
}

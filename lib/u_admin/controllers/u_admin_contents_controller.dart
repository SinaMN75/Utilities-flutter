part of "../u_admin.dart";
// Business logic relocated from the u_admin app so it can be shared across projects.

class UAdminContentsController extends UBaseController {
  List<UContentResponse> list = <UContentResponse>[];
  final GlobalKey<FormState> filterFormKey = GlobalKey<FormState>();

  // Filter (Content read supports filtering by tag only)
  final Rxn<TagContent> tagFilter = Rxn<TagContent>();

  Future<void> init() async {
    await read();
  }

  Future<void> read() async {
    state.loading();
    await UServices.content.read(
      p: UContentReadParams(
        pageNumber: pageNumber.value,
        pageSize: pageSize,
        tags: tagFilter.value == null ? null : <int>[tagFilter.value!.number],
        selectorArgs: const ContentSelectorArgs(media: MediaSelectorArgs()),
      ),
      onOk: (UResponse<List<UContentResponse>> r) {
        list = r.result ?? <UContentResponse>[];
        setTotalPages(r.totalCount);
        setListState(isEmpty: list.isEmpty);
      },
      onError: (UEmptyResponse e) => setError(e.message),
      onException: (String e) => setError(),
    );
  }

  void applyFilters() => reloadFirstPage(read);

  void clearFilters() {
    tagFilter.value = null;
    reloadFirstPage(read);
  }

  void create({required UContentCreateParams p, List<FileData>? files}) => UServices.content.create(
    p: p,
    onOk: (UResponse<String> r) {
      if (files.isNotNullOrEmpty() && r.result != null) {
        _uploadMedia(contentId: r.result!, files: files!, onDone: () => okCallback(r.message, read));
      } else {
        okCallback(r.message, read);
      }
    },
    onError: (UEmptyResponse r) => errorCallBack(r.message, read),
    onException: (String e) => errorCallBack(U.s.errorSubmittingForm, read),
  );

  void update({required UContentUpdateParams p, List<FileData>? files}) => UServices.content.update(
    p: p,
    onOk: (UEmptyResponse r) {
      if (files.isNotNullOrEmpty()) {
        _uploadMedia(contentId: p.id, files: files!, onDone: () => okCallback(r.message, read));
      } else {
        okCallback(r.message, read);
      }
    },
    onError: (UEmptyResponse r) => errorCallBack(r.message, read),
    onException: (String e) => errorCallBack(U.s.errorSubmittingForm, read),
  );

  Future<void> _uploadMedia({required String contentId, required List<FileData> files, required VoidCallback onDone}) async {
    for (final FileData file in files) {
      await UServices.media.create(
        p: UMediaCreateParams(file: file, contentId: contentId, tag1: TagMedia.image.number),
        onOk: (_) {},
        onError: (_) {},
        onException: (_) {},
      );
    }
    onDone();
  }

  void deleteMedia({required String mediaId, required VoidCallback onDone}) => UServices.media.delete(
    p: UIdParams(id: mediaId),
    onOk: (UEmptyResponse r) {
      UToast.snackBar(message: r.message);
      onDone();
    },
    onError: (UEmptyResponse r) => UToast.error(message: r.message),
    onException: (String e) => UToast.error(message: e),
  );

  void delete(UContentResponse i) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.areYouSureYouWantToDelete,
    onConfirm: () => UServices.content.delete(
      p: UIdParams(id: i.id),
      onOk: (UEmptyResponse r) {
        UNavigator.back();
        okCallback(r.message, read);
      },
      onError: (UEmptyResponse r) {
        UNavigator.back();
        errorCallBack(r.message, read);
      },
      onException: (String e) {
        UNavigator.back();
        UToast.error(message: e);
      },
    ),
  );
}

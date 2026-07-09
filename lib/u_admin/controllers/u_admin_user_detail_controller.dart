part of "../u_admin.dart";
// Business logic relocated from the u_admin app so it can be shared across projects.

class UAdminUserDetailController {
  final Rx<PageState> state = PageState.initial.obs;
  late UUserResponse user;

  void init({required UUserResponse user}) {
    this.user = user;
    read();
  }

  /// Reloads the user with all verification documents attached.
  Future<void> read() async {
    state.loading();
    await UServices.user.readById(
      p: UIdParams(
        id: user.id,
        selectorArgs: const UserSelectorArgs(address: AddressSelectorArgs(), nationalCardFront: true, nationalCardBack: true, birthCertificateFirst: true, eSignature: true, visualAuthentication: true),
      ),
      onOk: (UResponse<UUserResponse> response) {
        user = response.result!;
        state.loaded();
      },
      onError: (UEmptyResponse response) {
        state.error();
        UToast.error(message: response.message);
      },
      onException: (String response) {
        state.error();
        UToast.error(message: response);
      },
    );
  }

  /// True when every document has been verified.
  bool get isFullyVerified => user.tags.contains(TagUser.verified.number);

  /// Approves every document and marks the user as verified.
  void approve() {
    ULoading.show();
    UServices.user.update(
      p: UUserUpdateParams(
        id: user.id,
        birthCertificateFirstRejectionReason: "",
        nationalCardBackRejectionReason: "",
        nationalCardFrontRejectionReason: "",
        visualAuthenticationRejectionReason: "",
        eSignatureRejectionReason: "",
        addTags: <int>[TagUser.verified.number, TagUser.nationalCardBackVerified.number, TagUser.nationalCardFrontVerified.number, TagUser.birthCertificateFirstVerified.number, TagUser.eSignatureVerified.number, TagUser.visualAuthenticationVerified.number],
        removeTags: <int>[TagUser.awaitingVerification.number, TagUser.nationalCardBackAwaitingVerification.number, TagUser.nationalCardFrontAwaitingVerification.number, TagUser.birthCertificateFirstAwaitingVerification.number, TagUser.eSignatureAwaitingVerification.number, TagUser.visualAuthenticationAwaitingVerification.number],
      ),
      onOk: (UEmptyResponse r) {
        ULoading.dismiss();
        UToast.snackBar(message: r.message);
        UNavigator.back();
      },
      onError: (UEmptyResponse r) {
        ULoading.dismiss();
        UToast.error(message: r.message);
      },
      onException: (String e) {
        ULoading.dismiss();
        UToast.error(message: e);
      },
    );
  }

  /// Rejects the documents whose reason was provided.
  void reject({required UUserUpdateParams p}) {
    ULoading.show();
    UServices.user.update(
      p: p,
      onOk: (UEmptyResponse r) {
        ULoading.dismiss();
        UToast.snackBar(message: r.message);
        UNavigator.back();
      },
      onError: (UEmptyResponse r) {
        ULoading.dismiss();
        UToast.error(message: r.message);
      },
      onException: (String e) {
        ULoading.dismiss();
        UToast.error(message: e);
      },
    );
  }
}

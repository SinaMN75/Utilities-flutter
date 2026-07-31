part of "payment_flow.dart";

class UPaymentController {
  late UPaymentRequest request;
  final Rx<PageState> state = PageState.initial.obs;
  final RxInt balance = 0.obs;
  final RxBool paying = false.obs;

  Future<void> init({required UPaymentRequest request}) async {
    this.request = request;
    state.loading();
    final bool ok = await _reloadBalance();
    ok ? state.loaded() : state.error();
  }

  Future<bool> _reloadBalance() async {
    bool ok = false;
    await UServices.wallet.readByUserId(
      p: UIdParams(id: U.user.id),
      onOk: (UResponse<List<UWalletResponse>> response) {
        balance(response.result!.first.balance.toInt());
        ok = true;
      },
      onError: (UEmptyResponse response) => ok = false,
      onException: (String exception) => ok = false,
    );
    return ok;
  }

  bool get walletSufficient => balance.value >= request.amount;

  Future<void> payWithWallet() async {
    if (!walletSufficient) {
      UToast.error(message: U.s.insufficientWalletBalanceUsePaymentGateway);
      return;
    }
    await _settle();
  }

  Future<void> payWithIpg() async {
    paying(true);
    final bool charged = await UIpgFlow.topUp(request.amount);
    if (!charged) {
      paying(false);
      return;
    }
    await _reloadBalance();
    if (!walletSufficient) {
      UToast.error(message: U.s.walletChargeFailedRefundNotice);
      paying(false);
      return;
    }
    await _settle();
  }

  Future<void> _settle() async {
    paying(true);
    ULoading.show();
    try {
      final bool ok = await request.onPay();
      ULoading.dismiss();
      if (ok) UNavigator.back<bool>(true);
    } catch (e) {
      ULoading.dismiss();
      UToast.error(message: e.toString());
    } finally {
      paying(false);
    }
  }
}

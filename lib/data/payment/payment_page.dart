part of "payment_flow.dart";

class UPaymentPage extends StatefulWidget {
  const UPaymentPage({required this.request, super.key});

  final UPaymentRequest request;

  @override
  State<UPaymentPage> createState() => _UPaymentPageState();
}

class _UPaymentPageState extends State<UPaymentPage> {
  final UPaymentController c = UPaymentController();

  @override
  void initState() {
    c.init(request: widget.request);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(title: Text(U.s.payment)),
    body: Obx(() {
      if (c.state.isError()) return UErrorRetry(onTap: () => c.init(request: widget.request));
      if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
      return ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _orderBox().fadeSlideIn(),
          const SizedBox(height: 22),
          UTextBodyMedium(U.s.paymentMethod, fontWeight: FontWeight.bold).fadeSlideIn(milliseconds: 800),
          const SizedBox(height: 12),
          _option(
            icon: Icons.account_balance_wallet_outlined,
            title: U.s.payWithWallet,
            subtitle: c.walletSufficient ? "${U.s.balance}: ${c.balance.value.rial()}" : "${U.s.insufficientBalance}: ${c.balance.value.rial()}",
            enabled: c.walletSufficient && !c.paying.value,
            onTap: c.payWithWallet,
          ).fadeSlideIn(milliseconds: 1200),
          const SizedBox(height: 12),
          _option(
            icon: Icons.credit_card,
            title: U.s.onlinePayment,
            subtitle: U.s.amountWillBeAddedToWalletAndPaid,
            enabled: !c.paying.value,
            onTap: c.payWithIpg,
          ).fadeSlideIn(milliseconds: 1600),
        ],
      );
    }),
  );

  Widget _orderBox() {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return UContainer(
      radius: 18,
      padding: const EdgeInsets.all(18),
      color: scheme.surface,
      border: Border.all(color: scheme.outlineVariant),
      child: UColumn(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextTitleSmall(widget.request.title, fontWeight: FontWeight.bold),
          const SizedBox(height: 14),
          ...widget.request.lines.map(_line),
          Divider(color: scheme.outlineVariant, height: 24),
          URow(
            spacing: 0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              UTextBodyMedium(U.s.payableAmount, fontWeight: FontWeight.bold),
              UTextTitleMedium(widget.request.amount.rial(), fontWeight: FontWeight.bold, color: scheme.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _line(UPaymentLine l) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: URow(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        UTextLabelMedium(l.label, color: Theme.of(context).colorScheme.onSurfaceVariant),
        UTextBodyMedium(l.value),
      ],
    ),
  );

  Widget _option({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool enabled,
    required Future<void> Function() onTap,
  }) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child:
          UContainer(
            radius: 14,
            padding: const EdgeInsets.all(16),
            color: scheme.surface,
            border: Border.all(color: scheme.outlineVariant),
            child: URow(
              spacing: 0,
              children: <Widget>[
                UIconBackground(icon, color: scheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: UColumn(
                    spacing: 0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UTextBodyMedium(title, fontWeight: FontWeight.bold),
                      const SizedBox(height: 2),
                      UTextLabelSmall(subtitle, color: scheme.onSurfaceVariant),
                    ],
                  ),
                ),
                Icon(Icons.chevron_left, color: scheme.onSurfaceVariant),
              ],
            ),
          ).onTapInk(() {
            if (enabled) onTap();
          }),
    );
  }
}

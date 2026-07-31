part of "../../u_admin.dart";

// Pay a dorm invoice online via IPG. Opens the gateway; the backend charges the wallet then pays the invoice from it
// (invoice id + tag ride in additionalData, no separate pay-link transaction). Refreshes on success.
abstract class UAdminPayLink {
  static Future<void> dormBedInvoice(UDormBedInvoiceResponse i, {Future<void> Function()? onClosed}) async {
    final bool paid = await UIpg.pay(amount: i.netDue, tag: TagTxn.dormInvoice, invoiceId: i.id);
    if (paid) await onClosed?.call();
  }

  // Lists a contract's invoices with a one-tap online-pay for the unpaid ones.
  static void dormBedInvoiceList(UDormBedContractResponse contract, {Future<void> Function()? onClosed}) {
    final List<UDormBedInvoiceResponse> invoices = contract.invoices ?? <UDormBedInvoiceResponse>[];
    if (invoices.isEmpty) {
      UToast.error(message: U.s.noInvoiceFound);
      return;
    }
    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.payment),
        content: SizedBox(
          width: 420,
          child: UColumn(
            spacing: 0,
            mainAxisSize: MainAxisSize.min,
            children: invoices
                .map(
                  (UDormBedInvoiceResponse i) => ListTile(
                    dense: true,
                    title: UTextBodyMedium(i.netDue.rial()),
                    subtitle: UTextBodySmall(i.dueDate.toJalaliDate()),
                    trailing: i.isPaid
                        ? UTextBodySmall(U.s.paid, color: UAdminTheme.green)
                        : IconButton(
                            icon: const Icon(Icons.payments_rounded),
                            onPressed: () => dormBedInvoice(i, onClosed: onClosed),
                          ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

import "package:u/utilities.dart";

class UAdminParkingReportPage extends StatefulWidget {
  const UAdminParkingReportPage({super.key, this.parking});

  // When set, only this parking's reports are shown.
  final UParkingResponse? parking;

  @override
  State<UAdminParkingReportPage> createState() => _UAdminParkingReportPageState();
}

class _UAdminParkingReportPageState extends State<UAdminParkingReportPage> {
  final UAdminParkingReportController c = UAdminParkingReportController();

  @override
  void initState() {
    c.init(parking: widget.parking);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(title: Text(widget.parking == null ? U.s.parkingReports : "${U.s.parkingReports} · ${widget.parking!.title}")),
    body: Column(
      children: <Widget>[
        _summary(),
        _list().expanded(),
        Obx(
          () => UNumberPagination(
            currentPage: c.pageNumber.value,
            totalPages: c.totalPages.value,
            onPageChanged: (int page) {
              c.pageNumber(page);
              c.read();
            },
          ).pOnly(bottom: 16, top: 8),
        ),
      ],
    ),
  );

  Widget _summary() => Obx(() {
    if (!c.state.isLoaded()) return const SizedBox.shrink();
    return UContainer(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
      radius: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          UTextBodyMedium("${U.s.totalResults}: ${c.totalCount.toString().separateNumbers3By3()}"),
          UTextBodyMedium("${U.s.amount}: ${c.totalAmount.rial()}", fontWeight: FontWeight.bold),
        ],
      ),
    );
  });

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noParkingReportsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 800) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.parking, color: UAdminTheme.white, textAlign: .center).expanded(flex: 2),
            UTextBodyLarge(U.s.licencePlate, color: UAdminTheme.white, textAlign: .center).expanded(flex: 2),
            UTextBodyLarge(U.s.startDate, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.endDate, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.amount, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: UAdminTheme.white, textAlign: .center).expanded(flex: 0),
          ],
        ),
        itemBuilder: (BuildContext context, int index) => _itemDesktop(i: c.list[index], index: index),
        itemCount: c.list.length,
      );
    }
    return UListView(
      itemBuilder: (BuildContext context, int index) => _itemResponsive(i: c.list[index], index: index),
      itemCount: c.list.length,
    );
  });

  Widget _itemDesktop({required UParkingReportResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminTheme.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.parking?.title ?? "-", textAlign: .center).expanded(flex: 2),
      UTextBodyMedium(i.vehicle?.licencePlate ?? "-", textAlign: .center).expanded(flex: 2),
      UTextBodyMedium(i.startDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.endDate?.toJalaliDate() ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium((i.amount ?? 0).rial(), textAlign: .center).expanded(),
      IconButton(
        icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
        onPressed: () => c.delete(i),
      ).expanded(flex: 0),
    ],
  );

  Widget _itemResponsive({required UParkingReportResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.directions_car_rounded),
      title: UTextBodyMedium("${i.vehicle?.licencePlate ?? "-"} • ${i.parking?.title ?? "-"}"),
      subtitle: UTextBodySmall("${i.startDate.toJalaliDate()} → ${i.endDate?.toJalaliDate() ?? "-"} • ${(i.amount ?? 0).rial()}"),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
        onPressed: () => c.delete(i),
      ),
    ),
  );
}

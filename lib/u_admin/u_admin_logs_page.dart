part of "u_admin.dart";

class UAdminLogsPage extends StatefulWidget {
  const UAdminLogsPage({super.key});

  @override
  State<UAdminLogsPage> createState() => _UAdminLogsPageState();
}

class _UAdminLogsPageState extends State<UAdminLogsPage> with TickerProviderStateMixin {
  final UAdminLogsController c = UAdminLogsController();

  @override
  void initState() {
    super.initState();
    c.fetchLogStructure();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Log Viewer"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          tooltip: "Refresh",
          icon: const Icon(Icons.refresh),
          onPressed: c.fetchLogStructure,
        ),
      ],
    ),
    body: Obx(_buildBody),
  );

  Widget _buildBody() {
    if (c.state.isLoading()) {
      return const Center(child: CircularProgressIndicator());
    }

    if (c.state.isError()) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.error_outline, size: 48),
            const Text("Failed to load logs").pSymmetric(vertical: 8),
            UButton(title: "Retry", onTap: c.fetchLogStructure),
          ],
        ),
      );
    }

    if (c.logs.isEmpty) {
      return const Center(child: Text("No logs found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: c.logs.length,
      itemBuilder: (_, int yearIndex) {
        final YearLog year = c.logs[yearIndex];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ExpansionTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(
              "Year ${year.year}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            initiallyExpanded: yearIndex == 0,
            children: year.months.map(_buildMonthTile).toList(),
          ),
        );
      },
    );
  }

  Widget _buildMonthTile(MonthLog month) => ExpansionTile(
    leading: const Icon(Icons.calendar_view_month),
    title: UTextBodyLarge("Month ${month.month}"),
    children: month.days.map(_buildDayRow).toList(),
  );

  Widget _buildDayRow(DayLog day) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Row(
      children: <Widget>[
        UTextBodyMedium("Day ${day.day}"),
        const Spacer(),
        if (day.success != null)
          UButton(
            title: "Success",
            borderColor: Colors.green,
            foregroundColor: Colors.green,
            type: UButtonType.outlined,
            icon: const Icon(Icons.check_circle),
            onTap: () => _openLog(day.success!),
          ).pSymmetric(horizontal: 8),
        if (day.failed != null)
          UButton(
            title: "Failed",
            borderColor: Colors.red,
            foregroundColor: Colors.red,
            type: UButtonType.outlined,
            icon: const Icon(Icons.error),
            onTap: () => _openLog(day.failed!),
          ).pSymmetric(horizontal: 8),
      ],
    ),
  );

  void _openLog(String path) => c.fetchLogContent(
    path,
    (String content) {
      UNavigator.dialog(
        Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: _LogContentDialog(logContents: content),
        ),
      );
    },
  );
}

class _LogContentDialog extends StatelessWidget {
  final String logContents;

  const _LogContentDialog({required this.logContents});

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Material(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: <Widget>[
              const Icon(Icons.description_outlined),
              const SizedBox(width: 8),
              const UTextBodyMedium("Log Content"),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  UClipboard.set(logContents);
                  UToast.snackBar(message: "Copied to clipboard");
                },
              ),
              const IconButton(icon: Icon(Icons.close), onPressed: UNavigator.back),
            ],
          ),
        ),
      ),
      const Divider(height: 1),
      JsonViewer(jsonString: logContents).expanded().ltr(),
    ],
  );
}

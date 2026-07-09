part of "u_admin.dart";

class UAdminListView<T> extends StatelessWidget {
  const UAdminListView({required this.state, required this.items, required this.totalCount, required this.desktopHeader, required this.desktopRow, required this.mobileRow, required this.onRetry, required this.emptyText, super.key, this.desktopBreakpoint = 800});

  final Rx<PageState> state;

  final List<T> Function() items;
  final int Function() totalCount;
  final List<Widget> Function() desktopHeader;
  final Widget Function(T item, int index) desktopRow;
  final Widget Function(T item, int index) mobileRow;
  final VoidCallback onRetry;
  final String emptyText;
  final double desktopBreakpoint;

  @override
  Widget build(BuildContext context) => Obx(() {
    if (state.value.isError()) return _AdminListError(onRetry: onRetry);
    if (state.value.isEmpty()) return _AdminListEmpty(text: emptyText);
    if (!state.value.isLoaded()) return const Center(child: CircularProgressIndicator());

    final List<T> data = items();
    final bool desktop = MediaQuery.sizeOf(context).width >= desktopBreakpoint;
    final Widget list = desktop
        ? UListView(
            header: URow(backgroundColor: Theme.of(context).colorScheme.primary, padding: const EdgeInsets.all(8), children: desktopHeader()),
            itemBuilder: (BuildContext context, int index) => desktopRow(data[index], index),
            itemCount: data.length,
          )
        : UListView(itemBuilder: (BuildContext context, int index) => mobileRow(data[index], index), itemCount: data.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Row(
            children: <Widget>[
              Icon(Icons.format_list_bulleted_rounded, size: 16, color: Theme.of(context).disabledColor),
              const SizedBox(width: 6),
              UTextBodySmall("${U.s.totalResults}: ${totalCount().toString().separateNumbers3By3()}", color: Theme.of(context).disabledColor),
            ],
          ),
        ),
        list.expanded(),
      ],
    );
  });
}

class UAdminSortHeader extends StatelessWidget {
  const UAdminSortHeader({required this.title, required this.onTap, this.direction, super.key});

  final String title;
  final VoidCallback onTap;
  final bool? direction;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: UTextBodyLarge(title, color: Theme.of(context).colorScheme.onPrimary, textAlign: .center, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        if (direction != null) Icon(direction! ? Icons.arrow_upward : Icons.arrow_downward, size: 16, color: Theme.of(context).colorScheme.onPrimary),
      ],
    ),
  ).expanded();
}

class _AdminListError extends StatelessWidget {
  const _AdminListError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.cloud_off_rounded, size: 56, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 12),
        UTextBodyMedium(U.s.errorReadingData),
        const SizedBox(height: 12),
        UButton(title: U.s.tryAgain, icon: const Icon(Icons.refresh), onTap: onRetry, width: 180),
      ],
    ),
  );
}

class _AdminListEmpty extends StatelessWidget {
  const _AdminListEmpty({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.inbox_rounded, size: 56, color: Theme.of(context).disabledColor),
        const SizedBox(height: 12),
        UTextBodyMedium(text, color: Theme.of(context).disabledColor),
      ],
    ),
  );
}

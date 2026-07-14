import "package:u/utilities.dart";

class UAdminContentsPage extends StatefulWidget {
  const UAdminContentsPage({super.key});

  @override
  State<UAdminContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<UAdminContentsPage> {
  final UAdminContentsController c = UAdminContentsController();

  @override
  void initState() {
    c.init();
    super.initState();
  }

  TagContent? _tagOf(UContentResponse i) => TagContent.values.firstWhereOrNull((TagContent t) => i.tags.contains(t.number));

  @override
  Widget build(BuildContext context) =>
      UAdminScaffold(
        title: U.s.contents,
        onFilter: _showFilterDialog,
        onCreate: _showEditDialog,
        pageNumber: c.pageNumber,
        totalPages: c.totalPages,
        onPageChanged: (int page) {
          c.pageNumber(page);
          c.read();
        },
        body: UAdminListView<UContentResponse>(
          state: c.state,
          items: () => c.list,
          totalCount: () => c.totalCount,
          onRetry: c.read,
          emptyText: U.s.noContentFound,
          desktopBreakpoint: 720,
          desktopHeader: () =>
          <Widget>[
            UAdminTable.headerCell(U.s.image),
            UAdminTable.headerCell(U.s.contentType),
            UAdminTable.headerCell(U.s.title),
            UAdminTable.headerCell(U.s.description, flex: 2),
            UAdminTable.headerCell(U.s.createdAt),
            UAdminTable.headerCell(U.s.operations),
      ],
          desktopRow: _itemDesktop,
          mobileRow: _itemMobile,
    ),
  );

  Widget _itemMobile(UContentResponse i, int index) =>
      UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 48, height: 48, child: UImage(i.media.firstOrNull?.url ?? "")),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Chip(
                    label: Text(_tagOf(i)?.localizedTitle ?? "---"),
                    backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              UTextBodyLarge(i.jsonData.title ?? "---", maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              UTextBodySmall(i.jsonData.description ?? i.jsonData.detail1 ?? "---", maxLines: 2, overflow: TextOverflow.ellipsis, color: UAdminTheme.grey),
              const SizedBox(height: 4),
              UTextBodySmall(i.createdAt.toJalaliDate(), color: UAdminTheme.grey),
            ],
          ),
        ),
        _menu(i),
      ],
    ),
  );

  Widget _itemDesktop(UContentResponse i, int index) =>
      URow(
        backgroundColor: UAdminTable.rowColor(context, index),
    children: <Widget>[
      SizedBox(width: 48, height: 48, child: UImage(i.media.firstOrNull?.url ?? "")).expanded(),
      UAdminTable.cell(_tagOf(i)?.localizedTitle ?? "---"),
      UAdminTable.cell(i.jsonData.title ?? "---"),
      UTextBodyMedium(i.jsonData.description ?? i.jsonData.detail1 ?? "---", textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis).expanded(flex: 2),
      UAdminTable.cell(i.createdAt.toJalaliDate()),
      _menu(i).expanded(),
    ],
  );

  Widget _menu(UContentResponse i) =>
      UAdminOps.menu<UContentResponse>(
        context,
        item: i,
        handlers: UAdminActionHandlers<UContentResponse>(onEdit: (UContentResponse x) => _showEditDialog(p: x), onDelete: c.delete),
        fallback: (UAdminActionContext<UContentResponse> ctx) => <UAdminAction>[ctx.edit(), ctx.delete()],
  );

  void _showFilterDialog() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.filterContents),
      content: Form(
        key: c.filterFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Obx(
                () => UDropDownField<TagContent?>(
                  initialValue: c.tagFilter.value,
                  labelText: U.s.contentType,
                  items: <DropdownMenuItem<TagContent?>>[
                    DropdownMenuItem<TagContent?>(child: Text(U.s.all)),
                    ...TagContent.values.map(
                      (TagContent t) => DropdownMenuItem<TagContent?>(value: t, child: Text(t.localizedTitle)),
                    ),
                  ],
                  onChanged: (TagContent? v) => c.tagFilter.value = v,
                ),
              ).pSymmetric(vertical: 6),
              const SizedBox(height: 20),
              UButtonSubmitCancel(
                submitTitle: U.s.filter,
                cancelTitle: U.s.clearFilters,
                onSubmit: () {
                  c.applyFilters();
                  UNavigator.back();
                },
                onCancel: () {
                  c.clearFilters();
                  UNavigator.back();
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Future<void> _showEditDialog({UContentResponse? p}) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController title = TextEditingController(text: p?.jsonData.title);
    final TextEditingController subTitle = TextEditingController(text: p?.jsonData.subTitle);
    final TextEditingController description = TextEditingController(text: p?.jsonData.description);
    final TextEditingController detail1 = TextEditingController(text: p?.jsonData.detail1);
    final TextEditingController detail2 = TextEditingController(text: p?.jsonData.detail2);
    final TextEditingController instagram = TextEditingController(text: p?.jsonData.instagram);
    final TextEditingController telegram = TextEditingController(text: p?.jsonData.telegram);
    final TextEditingController whatsapp = TextEditingController(text: p?.jsonData.whatsapp);
    final TextEditingController phone = TextEditingController(text: p?.jsonData.phone);
    final Rx<TagContent> tag = ((p == null ? null : _tagOf(p)) ?? TagContent.aboutUs).obs;
    final List<_ExtraForm> extras = <_ExtraForm>[...?p?.jsonData.extra.map(_ExtraForm.fromModel)];
    final List<UMediaResponse> existingMedia = <UMediaResponse>[...p?.media ?? <UMediaResponse>[]];
    List<FileData> files = <FileData>[];

    await UNavigator.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState) => AlertDialog(
          title: Text(p == null ? U.s.createContent : U.s.editContent),
          content: SizedBox(
            width: context.dialogWidth(max: 520),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    UDropDownField<TagContent>(
                      initialValue: tag.value,
                      labelText: U.s.contentType,
                      items: TagContent.values.map((TagContent t) => DropdownMenuItem<TagContent>(value: t, child: Text(t.localizedTitle))).toList(),
                      onChanged: (TagContent? v) {
                        if (v != null) tag.value = v;
                      },
                    ).pSymmetric(vertical: 6),
                    UTextField(
                      controller: title,
                      labelText: U.s.title,
                      validator: UValidators.required(message: ""),
                    ).pSymmetric(vertical: 6),
                    UTextField(controller: subTitle, labelText: U.s.subtitle).pSymmetric(vertical: 6),
                    UTextField(controller: description, labelText: U.s.description, lines: 3).pSymmetric(vertical: 6),
                    UTextField(controller: detail1, labelText: U.s.detail1, lines: 2).pSymmetric(vertical: 6),
                    UTextField(controller: detail2, labelText: U.s.detail2, lines: 2).pSymmetric(vertical: 6),
                    const SizedBox(height: 8),
                    UTextBodyLarge(U.s.socialMedia).pOnly(bottom: 4),
                    UTextField(controller: instagram, labelText: U.s.instagram).pSymmetric(vertical: 6),
                    UTextField(controller: telegram, labelText: U.s.telegram).pSymmetric(vertical: 6),
                    UTextField(controller: whatsapp, labelText: U.s.whatsapp).pSymmetric(vertical: 6),
                    UTextField(controller: phone, labelText: U.s.phoneNumber).pSymmetric(vertical: 6),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        UTextBodyLarge(U.s.extraSections),
                        TextButton.icon(
                          onPressed: () => setDialogState(() => extras.add(_ExtraForm())),
                          icon: const Icon(Icons.add, size: 18),
                          label: Text(U.s.addSection),
                        ),
                      ],
                    ),
                    ...extras.mapIndexed(
                      (int index, _ExtraForm e) => _extraCard(index, e, () => setDialogState(() => extras.removeAt(index))),
                    ),
                    const SizedBox(height: 12),
                    if (existingMedia.isNotEmpty) ...<Widget>[
                      UTextBodyLarge(U.s.images).pOnly(bottom: 6),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: existingMedia.map((UMediaResponse m) => _mediaThumb(m, () => c.deleteMedia(mediaId: m.id, onDone: () => setDialogState(() => existingMedia.remove(m))))).toList(),
                      ).pOnly(bottom: 8),
                    ],
                    UFilePicker(onFilesChanged: (List<FileData> i) => files = i),
                    const SizedBox(height: 20),
                    UButtonSubmitCancel(
                      onSubmit: () => UValidators.validateForm(
                        key: formKey,
                        action: () {
                          final List<UContentExtra> extraModels = extras.map((_ExtraForm e) => e.toModel()).toList();
                          if (p == null)
                            c.create(
                              p: UContentCreateParams(
                                tags: <int>[tag.value.number],
                                title: title.text,
                                subTitle: subTitle.text.nullIfEmpty(),
                                description: description.text.nullIfEmpty(),
                                detail1: detail1.text.nullIfEmpty(),
                                detail2: detail2.text.nullIfEmpty(),
                                instagram: instagram.text.nullIfEmpty(),
                                telegram: telegram.text.nullIfEmpty(),
                                whatsapp: whatsapp.text.nullIfEmpty(),
                                phone: phone.text.nullIfEmpty(),
                                extra: extraModels,
                              ),
                              files: files,
                            );
                          else
                            c.update(
                              p: UContentUpdateParams(
                                id: p.id,
                                tags: <int>[tag.value.number],
                                title: title.text.nullIfEmpty(),
                                subTitle: subTitle.text.nullIfEmpty(),
                                description: description.text.nullIfEmpty(),
                                detail1: detail1.text.nullIfEmpty(),
                                detail2: detail2.text.nullIfEmpty(),
                                instagram: instagram.text.nullIfEmpty(),
                                telegram: telegram.text.nullIfEmpty(),
                                whatsapp: whatsapp.text.nullIfEmpty(),
                                phone: phone.text.nullIfEmpty(),
                                extra: extraModels,
                              ),
                              files: files,
                            );
                          UNavigator.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _extraCard(int index, _ExtraForm e, VoidCallback onRemove) => UContainer(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 6),
    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.06),
    radius: 8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UTextBodyMedium("${U.s.section} ${index + 1}"),
            IconButton(
              icon: Icon(Icons.close, size: 18, color: Theme.of(context).colorScheme.error),
              onPressed: onRemove,
            ),
          ],
        ),
        UTextField(controller: e.title, labelText: U.s.title).pSymmetric(vertical: 4),
        UTextField(controller: e.subtitle, labelText: U.s.subtitle).pSymmetric(vertical: 4),
        UTextField(controller: e.description, labelText: U.s.description, lines: 2).pSymmetric(vertical: 4),
        UTextField(controller: e.icon1, labelText: U.s.icon1).pSymmetric(vertical: 4),
        UTextField(controller: e.icon2, labelText: U.s.icon2).pSymmetric(vertical: 4),
        UTextField(controller: e.icon3, labelText: U.s.icon3).pSymmetric(vertical: 4),
      ],
    ),
  );

  Widget _mediaThumb(UMediaResponse m, VoidCallback onDelete) => Stack(
    children: <Widget>[
      SizedBox(width: 72, height: 72, child: UImage(m.url ?? "")),
      Positioned(
        top: 0,
        right: 0,
        child: InkWell(
          onTap: onDelete,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.error, shape: BoxShape.circle),
            padding: const EdgeInsets.all(2),
            child: const Icon(Icons.close, size: 14, color: UAdminTheme.white),
          ),
        ),
      ),
    ],
  );
}

class _ExtraForm {
  _ExtraForm({String? title, String? subtitle, String? description, String? icon1, String? icon2, String? icon3}) : title = TextEditingController(text: title), subtitle = TextEditingController(text: subtitle), description = TextEditingController(text: description), icon1 = TextEditingController(text: icon1), icon2 = TextEditingController(text: icon2), icon3 = TextEditingController(text: icon3);

  factory _ExtraForm.fromModel(UContentExtra m) => _ExtraForm(
    title: m.title,
    subtitle: m.subtitle,
    description: m.description,
    icon1: m.icon1,
    icon2: m.icon2,
    icon3: m.icon3,
  );

  final TextEditingController title;
  final TextEditingController subtitle;
  final TextEditingController description;
  final TextEditingController icon1;
  final TextEditingController icon2;
  final TextEditingController icon3;

  UContentExtra toModel() => UContentExtra(
    title: title.text,
    subtitle: subtitle.text,
    description: description.text,
    icon1: icon1.text.nullIfEmpty(),
    icon2: icon2.text.nullIfEmpty(),
    icon3: icon3.text.nullIfEmpty(),
  );
}

import "package:u/utilities.dart";

class UAdminBlogPage extends StatefulWidget {
  const UAdminBlogPage({super.key});

  @override
  State<UAdminBlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<UAdminBlogPage> {
  final UAdminBlogController c = UAdminBlogController();

  @override
  void initState() {
    c.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.blogs),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        IconButton(icon: const Icon(Icons.add), tooltip: U.s.create, onPressed: _showEditDialog),
      ],
    ),
    body: Column(
      children: <Widget>[
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

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noBlogsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 800) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const UTextBodyLarge("", color: UAdminAppColors.white, textAlign: .center).expanded(flex: 0),
            UTextBodyLarge(U.s.title, color: UAdminAppColors.white, textAlign: .center).expanded(flex: 3),
            UTextBodyLarge(U.s.status, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.viewCount, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.comments, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.createdAt, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: UAdminAppColors.white, textAlign: .center).expanded(),
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

  bool _isPublished(UBlogResponse i) => i.tags.contains(TagBlog.published.number);

  Widget _itemDesktop({required UBlogResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminAppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      SizedBox(width: 48, child: i.media?.firstOrNull?.url != null ? UImage(i.media!.first.url!) : const Icon(Icons.article_outlined)).expanded(flex: 0),
      UTextBodyMedium(i.title, textAlign: .center).expanded(flex: 3),
      Chip(
        label: Text(_isPublished(i) ? U.s.published : U.s.draft),
        backgroundColor: _isPublished(i) ? Colors.green.withValues(alpha: 0.15) : Colors.grey.withValues(alpha: 0.15),
      ).expanded(),
      UTextBodyMedium(i.viewCount.toString(), textAlign: .center).expanded(),
      UTextBodyMedium((i.commentCount ?? 0).toString(), textAlign: .center).expanded(),
      UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UBlogResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.article_outlined),
      title: UTextBodyMedium(i.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextBodyMedium(_isPublished(i) ? U.s.published : U.s.draft),
          UTextBodySmall("${i.viewCount} ${U.s.viewCount} • ${i.commentCount ?? 0} ${U.s.comments} • ${i.createdAt.toJalaliDate()}"),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UBlogResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
        onTap: () => _showEditDialog(p: i),
      ),
      PopupMenuItem<String>(
        child: UIconTextHorizontal(
          leading: Icon(_isPublished(i) ? Icons.unpublished_outlined : Icons.publish_rounded, size: 20),
          trailing: Text(_isPublished(i) ? U.s.unpublish : U.s.publish),
        ),
        onTap: () => _isPublished(i) ? c.unpublish(i) : c.publish(i),
      ),
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.comment_outlined, size: 20), trailing: Text(U.s.comments)),
        onTap: () => _showCommentsDialog(i),
      ),
      PopupMenuItem<String>(
        child: UIconTextHorizontal(
          leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
          trailing: Text(U.s.delete, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ),
        onTap: () => c.delete(i),
      ),
    ],
  );

  void _showFilterDialog() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.filterBlogs),
      content: Form(
        key: c.filterFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UTextField(controller: c.titleFilter, labelText: U.s.title).pSymmetric(vertical: 6),
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

  void _showCommentsDialog(UBlogResponse i) {
    UNavigator.dialog(
      AlertDialog(
        title: Text("${U.s.comments} · ${i.title}"),
        content: SizedBox(
          width: context.dialogWidth(),
          child: (i.comments?.isEmpty ?? true)
              ? Center(child: Text(U.s.noCommentsFound).pSymmetric(vertical: 24))
              : SingleChildScrollView(
                  child: Column(
                    children: (i.comments ?? <UCommentResponse>[])
                        .map(
                          (UCommentResponse cm) => ListTile(
                            dense: true,
                            leading: const Icon(Icons.person_outline),
                            title: UTextBodyMedium(cm.description),
                            subtitle: UTextBodySmall("${cm.user?.userName ?? "---"} • ${cm.createdAt.toJalaliDate()}"),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
        actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
      ),
    );
  }

  Future<void> _showEditDialog({UBlogResponse? p}) async {
    final TextEditingController title = TextEditingController(text: p?.title);
    final TextEditingController subtitle = TextEditingController(text: p?.subtitle);
    final TextEditingController slug = TextEditingController(text: p?.slug);
    final TextEditingController content = TextEditingController(text: p?.content);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<FileData> files = <FileData>[];
    final List<UCategoryResponse> selectedCategories = <UCategoryResponse>[...(p?.categories ?? <UCategoryResponse>[])];
    final List<UCategoryResponse> allCategories = await c.fetchCategories();

    await UNavigator.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState) => AlertDialog(
          title: Text(p == null ? U.s.createBlog : U.s.editBlog),
          content: SizedBox(
            width: context.dialogWidth(max: 480),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    UTextField(
                      controller: title,
                      labelText: U.s.title,
                      validator: UValidators.required(message: ""),
                    ).pSymmetric(vertical: 6),
                    UTextField(controller: subtitle, labelText: U.s.subtitle).pSymmetric(vertical: 6),
                    UTextField(controller: slug, labelText: U.s.slug).pSymmetric(vertical: 6),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: UTextBodyMedium(U.s.content, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ).pOnly(top: 6, bottom: 4),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        final String? html = await URichTextEditor.open(initialHtml: content.text);
                        if (html != null) setDialogState(() => content.text = html);
                      },
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 72, maxHeight: 220),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).dividerColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: content.text.trim().isEmpty ? Row(children: <Widget>[const Icon(Icons.edit_note), const SizedBox(width: 8), Text(U.s.richTextEditor)]) : SingleChildScrollView(child: UHtmlView(html: content.text)),
                      ),
                    ).pSymmetric(vertical: 6),
                    const SizedBox(height: 12),
                    if (allCategories.isNotEmpty)
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: allCategories
                            .map(
                              (UCategoryResponse cat) => FilterChip(
                                label: Text(cat.title),
                                selected: selectedCategories.any((UCategoryResponse x) => x.id == cat.id),
                                onSelected: (bool selected) => setDialogState(() {
                                  if (selected)
                                    selectedCategories.add(cat);
                                  else
                                    selectedCategories.removeWhere((UCategoryResponse x) => x.id == cat.id);
                                }),
                              ),
                            )
                            .toList(),
                      ).pSymmetric(vertical: 6),
                    const SizedBox(height: 12),
                    UFilePicker(onFilesChanged: (List<FileData> i) => files = i),
                    const SizedBox(height: 20),
                    UButtonSubmitCancel(
                      onSubmit: () => UValidators.validateForm(
                        key: formKey,
                        action: () {
                          final List<String> categoryIds = selectedCategories.map((UCategoryResponse cat) => cat.id).toList();
                          if (p == null)
                            c.create(
                              p: UBlogCreateParams(
                                tags: <int>[TagBlog.draft.number],
                                title: title.text,
                                subtitle: subtitle.text.nullIfEmpty(),
                                slug: slug.text.nullIfEmpty(),
                                content: content.text.nullIfEmpty(),
                                categories: categoryIds,
                              ),
                              files: files,
                            );
                          else
                            c.update(
                              p: UBlogUpdateParams(
                                id: p.id,
                                title: title.text,
                                subtitle: subtitle.text.nullIfEmpty(),
                                slug: slug.text.nullIfEmpty(),
                                content: content.text.nullIfEmpty(),
                                categories: categoryIds,
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
}

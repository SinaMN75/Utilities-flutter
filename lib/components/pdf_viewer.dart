import "package:u/utilities.dart";

class UPdfViewer extends StatefulWidget {
  const UPdfViewer({
    required this.source,
    super.key,
    this.initialPageNumber = 1,
    this.initialZoomLevel = 1.0,
    this.maxZoomLevel = 3.0,
    this.scrollDirection = PdfScrollDirection.vertical,
    this.enableAnnotations = true,
    this.enableTextSelection = true,
    this.onPageChanged,
    this.onZoomChanged,
    this.onError,
    this.loadingIndicator,
    this.errorIndicator,
    this.showLoading = true,
    this.constraints,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.onDocumentLoaded,
    this.onDocumentLoadFailed,
    this.searchBar,
  });

  final PdfViewerSource source;
  final int initialPageNumber;
  final double initialZoomLevel;
  final double maxZoomLevel;
  final PdfScrollDirection scrollDirection;
  final bool enableAnnotations;
  final bool enableTextSelection;
  final void Function(PdfPageChangedDetails)? onPageChanged;
  final void Function(PdfZoomLevelChangedCallback)? onZoomChanged;
  final void Function(dynamic)? onError;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final bool showLoading;
  final BoxConstraints? constraints;
  final EdgeInsets padding;
  final PdfViewerController? controller;
  final void Function(PdfDocumentLoadedDetails)? onDocumentLoaded;
  final void Function(PdfDocumentLoadFailedDetails)? onDocumentLoadFailed;
  final Widget? searchBar; // Optional search UI

  @override
  State<UPdfViewer> createState() => _UPdfViewerState();
}

class _UPdfViewerState extends State<UPdfViewer> {
  late final PdfViewerController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? PdfViewerController();
  }

  @override
  Widget build(BuildContext context) => UContainer(
        padding: widget.padding,
        constraints: widget.constraints,
        child: Column(
          children: <Widget>[
            if (widget.searchBar != null) ...<Widget>[
              widget.searchBar!,
              const SizedBox(height: 8),
            ],
            Expanded(
              child: Stack(
                children: <Widget>[
                  if (_hasError && widget.errorIndicator != null)
                    widget.errorIndicator!
                  else if (_hasError)
                    Center(
                      child: Text(
                        _errorMessage ?? "Failed to load PDF",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                      ),
                    )
                  else
                    widget.source.toSfPdfViewer(
                      controller: _controller,
                      initialPageNumber: widget.initialPageNumber,
                      initialZoomLevel: widget.initialZoomLevel,
                      maxZoomLevel: widget.maxZoomLevel,
                      scrollDirection: widget.scrollDirection,
                      enableAnnotation: widget.enableAnnotations,
                      enableTextSelection: widget.enableTextSelection,
                      onPageChanged: widget.onPageChanged,
                      onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                        if (widget.showLoading) setState(() => _isLoading = false);
                        widget.onDocumentLoaded?.call(details);
                      },
                      onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                        if (widget.showLoading) setState(() => _isLoading = false);
                        setState(() {
                          _hasError = true;
                          _errorMessage = details.description;
                        });
                        widget.onError?.call(details);
                        widget.onDocumentLoadFailed?.call(details);
                        if (context.mounted && widget.onError == null) {
                          UNavigator.snackbar(message: "Failed to load PDF: ${details.description}");
                        }
                      },
                    ),
                  if (widget.showLoading && _isLoading && !_hasError) widget.loadingIndicator ?? const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ],
        ),
      );
}

// Helper class to unify PDF source types (file, network, asset, memory)
class PdfViewerSource {
  final String? url;
  final String? assetPath;
  final Uint8List? bytes;
  final File? file;

  PdfViewerSource.network(this.url)
      : assetPath = null,
        bytes = null,
        file = null;

  PdfViewerSource.asset(this.assetPath)
      : url = null,
        bytes = null,
        file = null;

  PdfViewerSource.memory(this.bytes)
      : url = null,
        assetPath = null,
        file = null;

  PdfViewerSource.file(this.file)
      : url = null,
        assetPath = null,
        bytes = null;

  Widget toSfPdfViewer({
    required PdfViewerController controller,
    int initialPageNumber = 1,
    double initialZoomLevel = 1.0,
    double maxZoomLevel = 3.0,
    PdfScrollDirection scrollDirection = PdfScrollDirection.vertical,
    bool enableAnnotation = true,
    bool enableTextSelection = true,
    void Function(PdfPageChangedDetails)? onPageChanged,
    void Function(PdfDocumentLoadedDetails)? onDocumentLoaded,
    void Function(PdfDocumentLoadFailedDetails)? onDocumentLoadFailed,
  }) {
    if (url != null) {
      return SfPdfViewer.network(
        url!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        scrollDirection: scrollDirection,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
      );
    } else if (assetPath != null) {
      return SfPdfViewer.asset(
        assetPath!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        scrollDirection: scrollDirection,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
      );
    } else if (bytes != null) {
      return SfPdfViewer.memory(
        bytes!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        scrollDirection: scrollDirection,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
      );
    } else if (file != null) {
      return SfPdfViewer.file(
        file!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        scrollDirection: scrollDirection,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
      );
    }
    throw ArgumentError("Invalid PDF source: At least one source type must be provided.");
  }
}

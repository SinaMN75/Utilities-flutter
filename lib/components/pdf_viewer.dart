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
    this.watermarkText,
    this.showInfoPanel = true,
    this.enableOfflineDownload = false,
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
  final Widget? searchBar;
  final String? watermarkText;
  final bool showInfoPanel;
  final bool enableOfflineDownload;

  @override
  State<UPdfViewer> createState() => _UPdfViewerState();
}

class _UPdfViewerState extends State<UPdfViewer> {
  late final PdfViewerController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;
  int _totalPages = 0;
  String? _fileName;
  int? _fileSize;

  // We store the active bytes of the document here so we can edit+reload.
  Uint8List? _documentBytes;

  // Selection data from viewer
  String? _selectedText;
  Rect? _globalSelectedRegion; // selection region in global (screen) coordinates
  int _selectedPageNumber = 1;

  // toolbar visibility
  bool _showSelectionToolbar = false;
  Offset? _toolbarPosition;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? PdfViewerController();
    _prepareSource();
  }

  Future<void> _prepareSource() async {
    try {
      // load bytes from whichever source is provided and gather metadata
      if (widget.source.bytes != null) {
        _documentBytes = widget.source.bytes;
        _fileName = "Memory PDF";
        _fileSize = _documentBytes!.lengthInBytes;
      } else if (widget.source.file != null) {
        final File f = widget.source.file!;
        _documentBytes = await f.readAsBytes();
        _fileName = f.uri.pathSegments.last;
        _fileSize = (await f.length());
      } else if (widget.source.url != null) {
        // For remote URL, just set the filename; viewer will stream it.
        // If you want to download remote bytes first (to annotate), fetch them (not done here).
        _fileName = widget.source.url!.split("/").last;
        _fileSize = null;
        // leave _documentBytes null — viewer will load from network.
      } else if (widget.source.assetPath != null) {
        _fileName = widget.source.assetPath!.split("/").last;
        // load asset bytes if you want annotation support
        try {
          final ByteData data = await DefaultAssetBundle.of(context).load(widget.source.assetPath!);
          _documentBytes = data.buffer.asUint8List();
          _fileSize = _documentBytes!.lengthInBytes;
        } catch (e) {
          // ignore if can't load; viewer may load from asset directly
        }
      }
      setState(() {});
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = "Failed to prepare PDF: $e";
      });
    }
  }

  /// Save bytes to a file inside app documents dir (secure-ish) and show path
  Future<String?> _saveBytesToAppDoc(Uint8List bytes, {String? suggestedName}) async {
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String name = suggestedName ?? (_fileName ?? "document");
      final String filePath = '${dir.path}/${name.replaceAll(RegExp(r'[^a-zA-Z0-9_.-]'), '_')}_edited.pdf';
      final File f = File(filePath);
      await f.writeAsBytes(bytes, flush: true);
      return filePath;
    } catch (e) {
      return null;
    }
  }

  /// Public: Save current _documentBytes to disk (download)
  Future<void> _downloadOffline() async {
    try {
      if (_documentBytes == null) {
        // If we don't have bytes (e.g., viewer loaded from URL stream), try to export annotations or ask user to download via URL.
        UNavigator.snackbar(message: "Document bytes not available for secure offline save.");
        return;
      }
      final String? path = await _saveBytesToAppDoc(_documentBytes!, suggestedName: _fileName);
      if (path != null) {
        UNavigator.snackbar(message: "PDF saved securely at $path");
      } else {
        UNavigator.snackbar(message: "Failed to save PDF locally.");
      }
    } catch (e) {
      UNavigator.snackbar(message: "Failed to save PDF: $e");
    }
  }

  /// Called when the viewer notifies selection changes
  void _onTextSelectionChanged(PdfTextSelectionChangedDetails details) {
    // details.selectedText and details.globalSelectedRegion are provided by the viewer.
    _selectedText = details.selectedText;
    _globalSelectedRegion = details.globalSelectedRegion;
    // Syncfusion doesn't give page in this callback; use controller.pageNumber property.
    // (controller.pageNumber is available after load)
    _selectedPageNumber = _controller.pageNumber;

    // If there's selectedText, show toolbar near the selection
    if ((_selectedText != null && _selectedText!.trim().isNotEmpty) && _globalSelectedRegion != null) {
      // compute toolbar pos from region center
      final Rect region = _globalSelectedRegion!;
      final Offset center = Offset(region.left + region.width / 2, region.top);
      setState(() {
        _showSelectionToolbar = true;
        _toolbarPosition = center;
      });
    } else {
      setState(() {
        _showSelectionToolbar = false;
        _toolbarPosition = null;
      });
    }
  }

  /// Add a text-markup annotation (highlight / underline / strike) to the PDF and save the modified bytes.
  ///
  /// type: 'highlight' | 'underline' | 'strike'
  Future<void> _addTextMarkupAnnotation(String type) async {
    if (_selectedText == null || _selectedText!.trim().isEmpty) {
      UNavigator.snackbar(message: "No text selected.");
      return;
    }

    // We need the document bytes to edit. If we don't have bytes loaded, we must get them first.
    if (_documentBytes == null) {
      // Try to request bytes from viewer controller if exported API exists.
      UNavigator.snackbar(message: "Cannot annotate: document bytes not available (load from File/Memory).");
      return;
    }

    try {
      // Load as editable PdfDocument (Syncfusion PDF library)
      final PdfDocument document = PdfDocument(inputBytes: _documentBytes);

      // page index is zero-based
      final int pageIndex = _selectedPageNumber - 1;
      if (pageIndex < 0 || pageIndex >= document.pages.count) {
        UNavigator.snackbar(message: "Invalid page for annotation.");
        document.dispose();
        return;
      }

      // Extract text lines from that page and find matching lines that contain the selectedText.
      final PdfTextExtractor extractor = PdfTextExtractor(document);
      final List<TextLine> lines = extractor.extractTextLines(startPageIndex: pageIndex, endPageIndex: pageIndex);

      // For each TextLine, search for the selectedText. When found, create a markup annotation
      // at the TextLine.bounds (or a series of bounds if selectedText spans multiple lines).
      // NOTE: this matching is a heuristic; for robust multi-line matching you'd need
      // to match fragments over multiple consecutive TextLine objects.
      final String needle = _selectedText!.trim();
      final List<Rect> matchedRects = <Rect>[];

      for (final TextLine line in lines) {
        final String lineText = line.text;
        if (lineText.contains(needle)) {
          // The Syncfusion TextLine has a 'bounds' property with location in PDF page coordinates.
          // Map it to Flutter Rect (left, top, width, height)
          final Rect r = line.bounds;
          matchedRects.add(Rect.fromLTWH(r.left, r.top, r.width, r.height));
          // If you want multiple occurrences in one line, use indexOf loop (omitted for brevity).
        } else {
          // try partial matching per word sequence
          // omitted for brevity — will only match lines containing the exact selected snippet
        }
      }

      if (matchedRects.isEmpty) {
        // As fallback, try to add annotation at full page (visible but not ideal).
        UNavigator.snackbar(message: "Could not resolve selection bounds precisely — adding annotation at top of page.");
        final PdfPage page = document.pages[pageIndex];
        const Rect fallbackRect = Rect.fromLTWH(10, 10, 200, 20);
        final PdfTextMarkupAnnotation annotation = PdfTextMarkupAnnotation(
          fallbackRect,
          "Auto highlight",
          PdfColor(255, 255, 0),
        )..color = PdfColor(255, 255, 0); // yellow
        page.annotations.add(annotation);
      } else {
        // Add a markup annotation for each matched rectangle
        final PdfPage page = document.pages[pageIndex];
        final PdfTextMarkupAnnotationType markType = (type == "underline")
            ? PdfTextMarkupAnnotationType.underline
            : (type == "strike")
                ? PdfTextMarkupAnnotationType.strikethrough
                : PdfTextMarkupAnnotationType.highlight;

        for (final Rect rect in matchedRects) {
          // Convert Flutter Rect (which we got from TextLine.bounds) to Rect
          final Rect r = Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height);

          final PdfTextMarkupAnnotation annotation = PdfTextMarkupAnnotation(
            r,
            "User highlight",
            PdfColor(255, 255, 0),
          );
          // set appearance / color
          annotation.color = (markType == PdfTextMarkupAnnotationType.highlight) ? PdfColor(255, 255, 0) : PdfColor(255, 0, 0);
          annotation.setAppearance = true;
          page.annotations.add(annotation);
        }
      }

      // Save modified document to bytes
      final List<int> saved = await document.save();
      document.dispose();

      final Uint8List newBytes = Uint8List.fromList(saved);
      // update our active bytes
      _documentBytes = newBytes;

      // Optionally save to file
      final String? savedPath = await _saveBytesToAppDoc(newBytes, suggestedName: _fileName);
      if (savedPath != null) {
        UNavigator.snackbar(message: "Annotation added and saved: $savedPath");
      } else {
        UNavigator.snackbar(message: "Annotation added.");
      }

      // Reload viewer from new bytes so annotations are visible.
      setState(() {
        // we simply force a rebuild and rely on PdfViewerSource.memory to render updated bytes
      });
      // Replace viewer source with memory bytes (so toSfPdfViewer reads memory)
      widget.source._replaceWithMemory(_documentBytes!); // helper (below)
    } catch (e) {
      UNavigator.snackbar(message: "Failed to add annotation: $e");
    }
  }

  /// Add a sticky-note comment at (approx) the selection location.
  Future<void> _addComment(String text) async {
    if (_documentBytes == null) {
      UNavigator.snackbar(message: "Document bytes not available for comment.");
      return;
    }
    try {
      final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
      final int pageIndex = _selectedPageNumber - 1;
      if (pageIndex < 0 || pageIndex >= document.pages.count) {
        document.dispose();
        UNavigator.snackbar(message: "Invalid page for comment.");
        return;
      }

      final PdfPage page = document.pages[pageIndex];

      // map global selection region to PDF page coordinates — approximate by placing near top-left of selected region.
      // Note: precise coordinate mapping between viewer pixels and PDF points can be tricky — this heuristic places comment on page reasonably.
      double x = 50;
      double y = 50;
      if (_globalSelectedRegion != null) {
        // use selection's left/top as a hint (NOTE: this is screen coords; mapping to PDF points may require scale/offset)
        x = _globalSelectedRegion!.left;
        y = _globalSelectedRegion!.top;
      }

      final Rect bounds = Rect.fromLTWH(x, y, 20, 20);
      final PdfPopupAnnotation popup = PdfPopupAnnotation(bounds, "Comment")..text = text;
      // Add popup to page
      page.annotations.add(popup);

      final List<int> saved = await document.save();
      document.dispose();
      _documentBytes = Uint8List.fromList(saved);
      await _saveBytesToAppDoc(_documentBytes!, suggestedName: _fileName);
      widget.source._replaceWithMemory(_documentBytes!);

      UNavigator.snackbar(message: "Comment added.");
    } catch (e) {
      UNavigator.snackbar(message: "Failed to add comment: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final String sizeKB = _fileSize != null ? "${(_fileSize! / 1024).toStringAsFixed(1)} KB" : "";
    return UContainer(
      padding: widget.padding,
      constraints: widget.constraints,
      child: Column(
        children: <Widget>[
          if (widget.showInfoPanel)
            Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "${_fileName ?? "Unknown"}  |  $sizeKB  |  صفحات: $_totalPages",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (widget.enableOfflineDownload)
                    IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: _downloadOffline,
                    ),
                ],
              ),
            ),
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
                  Center(child: Text(_errorMessage ?? "Failed to load PDF", style: const TextStyle(color: Colors.red)))
                else
                  // Render viewer from memory bytes if available (so annotations show), otherwise use original source
                  (_documentBytes != null)
                      ? SfPdfViewer.memory(
                          _documentBytes!,
                          controller: _controller,
                          initialPageNumber: widget.initialPageNumber,
                          initialZoomLevel: widget.initialZoomLevel,
                          maxZoomLevel: widget.maxZoomLevel,
                          scrollDirection: widget.scrollDirection,
                          enableDocumentLinkAnnotation: widget.enableAnnotations,
                          enableTextSelection: widget.enableTextSelection,
                          onPageChanged: (PdfPageChangedDetails details) {
                            widget.onPageChanged?.call(details);
                            // update page number for selection mapping
                            setState(() {
                              _selectedPageNumber = _controller.pageNumber;
                            });
                          },
                          onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                            if (widget.showLoading) setState(() => _isLoading = false);
                            setState(() {
                              _totalPages = details.document.pages.count;
                            });
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
                          },
                          onTextSelectionChanged: _onTextSelectionChanged,
                        )
                      : widget.source.toSfPdfViewer(
                          controller: _controller,
                          initialPageNumber: widget.initialPageNumber,
                          initialZoomLevel: widget.initialZoomLevel,
                          maxZoomLevel: widget.maxZoomLevel,
                          scrollDirection: widget.scrollDirection,
                          enableAnnotation: widget.enableAnnotations,
                          enableTextSelection: widget.enableTextSelection,
                          onPageChanged: (PdfPageChangedDetails details) {
                            widget.onPageChanged?.call(details);
                            setState(() {
                              _selectedPageNumber = _controller.pageNumber;
                            });
                          },
                          onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                            if (widget.showLoading) setState(() => _isLoading = false);
                            setState(() {
                              _totalPages = details.document.pages.count;
                            });
                            widget.onDocumentLoaded?.call(details);
                            // try to fetch bytes from loaded document if available (the viewer does not give bytes).
                          },
                          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                            if (widget.showLoading) setState(() => _isLoading = false);
                            setState(() {
                              _hasError = true;
                              _errorMessage = details.description;
                            });
                            widget.onError?.call(details);
                            widget.onDocumentLoadFailed?.call(details);
                          },
                          // show selection change only if using the viewer constructor
                        ),
                if (widget.watermarkText != null)
                  IgnorePointer(
                    child: Center(
                      child: Text(
                        widget.watermarkText!,
                        style: TextStyle(fontSize: 48, color: Colors.black.withValues(alpha: 0.08), fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (widget.showLoading && _isLoading && !_hasError) widget.loadingIndicator ?? const Center(child: CircularProgressIndicator()),

                // Selection toolbar overlay
                if (_showSelectionToolbar && _toolbarPosition != null)
                  Positioned(
                    left: (_toolbarPosition!.dx - 80).clamp(8.0, MediaQuery.of(context).size.width - 160.0),
                    top: (_toolbarPosition!.dy - 60).clamp(8.0, MediaQuery.of(context).size.height - 80.0),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).cardColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.highlight),
                              tooltip: "Highlight",
                              onPressed: () {
                                _addTextMarkupAnnotation("highlight");
                                setState(() {
                                  _showSelectionToolbar = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.format_underline),
                              tooltip: "Underline",
                              onPressed: () {
                                _addTextMarkupAnnotation("underline");
                                setState(() {
                                  _showSelectionToolbar = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.strikethrough_s),
                              tooltip: "Strike",
                              onPressed: () {
                                _addTextMarkupAnnotation("strike");
                                setState(() {
                                  _showSelectionToolbar = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.comment),
                              tooltip: "Add comment",
                              onPressed: () async {
                                final String? comment = await _showCommentDialog();
                                if (comment != null && comment.trim().isNotEmpty) {
                                  await _addComment(comment.trim());
                                  setState(() {
                                    _showSelectionToolbar = false;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _showCommentDialog() async {
    final TextEditingController ctl = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text("Add comment"),
        content: TextField(controller: ctl, maxLines: 4, decoration: const InputDecoration(hintText: "Comment text...")),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text("Cancel")),
          ElevatedButton(onPressed: () => Navigator.of(ctx).pop(ctl.text), child: const Text("Add")),
        ],
      ),
    );
  }
}

/// Helper class to unify PDF source types (file, network, asset, memory)
class PdfViewerSource {
  String? url;
  final String? assetPath;
  Uint8List? bytes;
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

  // Convert this source to a SfPdfViewer widget (original)
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
        onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
          // If using toSfPdfViewer directly, the parent widget may want to hook selection.
        },
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
        onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
          // can't forward easily here; consumer widget will attach
        },
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

  // internal helper used by the viewer to swap the source to memory bytes after edits
  void _replaceWithMemory(Uint8List newBytes) {
    bytes = newBytes;
    url = null;
    // assetPath and file remain null
  }
}

class PdfExamplePage extends StatefulWidget {
  const PdfExamplePage({super.key});

  @override
  State<PdfExamplePage> createState() => _PdfExamplePageState();
}

class _PdfExamplePageState extends State<PdfExamplePage> {
  late final PdfViewerController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("UPdfViewer Demo"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.zoom_in),
              onPressed: () {
                _pdfController.zoomLevel = (_pdfController.zoomLevel + 0.25).clamp(1.0, 3.0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.zoom_out),
              onPressed: () {
                _pdfController.zoomLevel = (_pdfController.zoomLevel - 0.25).clamp(1.0, 3.0);
              },
            ),
          ],
        ),
        body: UPdfViewer(
          source: PdfViewerSource.asset("assets/sample.pdf"),
          // load from asset
          controller: _pdfController,
          watermarkText: "CONFIDENTIAL",
          enableOfflineDownload: true,

          // --- event hooks (optional) ---
          onPageChanged: (PdfPageChangedDetails details) {
            debugPrint("Page changed: ${details.newPageNumber}");
          },
          onDocumentLoaded: (PdfDocumentLoadedDetails details) {
            debugPrint("Document loaded, total pages: ${details.document.pages.count}");
          },
          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
            debugPrint("Load failed: ${details.description}");
          },

          // optional search bar
          searchBar: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search text...",
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  _pdfController.searchText(value);
                }
              },
            ),
          ),
        ),
      );
}
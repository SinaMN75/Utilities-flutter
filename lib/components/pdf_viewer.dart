import "package:http/http.dart" as http;
import "package:permission_handler/permission_handler.dart";
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
  Uint8List? _documentBytes;
  String? _selectedText;
  Rect? _globalSelectedRegion;
  int _selectedPageNumber = 1;
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
      if (widget.source.bytes != null) {
        _documentBytes = widget.source.bytes;
        _fileName = "Memory PDF";
        _fileSize = _documentBytes!.lengthInBytes;
      } else if (widget.source.file != null) {
        final File f = widget.source.file!;
        _documentBytes = await f.readAsBytes();
        _fileName = f.uri.pathSegments.last;
        _fileSize = await f.length();
      } else if (widget.source.url != null) {
        _fileName = widget.source.url!.split("/").last;
        final http.Response response = await http.get(Uri.parse(widget.source.url!));
        if (response.statusCode == 200) {
          _documentBytes = response.bodyBytes;
          _fileSize = _documentBytes!.lengthInBytes;
        } else {
          _fileSize = null;
        }
      } else if (widget.source.assetPath != null) {
        _fileName = widget.source.assetPath!.split("/").last;
        final ByteData data = await DefaultAssetBundle.of(context).load(widget.source.assetPath!);
        _documentBytes = data.buffer.asUint8List();
        _fileSize = _documentBytes!.lengthInBytes;
      }

      if (_documentBytes != null) {
        final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
        _totalPages = document.pages.count;
        document.dispose();
      }

      setState(() {});
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = "Failed to prepare PDF: $e";
      });
    }
  }

  Future<String?> _saveBytesToAppDoc(Uint8List bytes, {String? suggestedName}) async {
    try {
      if (await Permission.storage.request().isDenied) {
        UNavigator.snackbar(message: "Storage permission denied");
        return null;
      }
      final Directory dir = await getApplicationDocumentsDirectory();
      final String name = suggestedName ?? (_fileName ?? "document");
      final String filePath = '${dir.path}/${name.replaceAll(RegExp(r'[^a-zA-Z0-9_.-]'), '_')}_${const Uuid().v4()}.pdf';
      final File f = File(filePath);
      await f.writeAsBytes(bytes, flush: true);
      return filePath;
    } catch (e) {
      UNavigator.snackbar(message: "Failed to save PDF: $e");
      return null;
    }
  }

  Future<void> _downloadOffline() async {
    try {
      if (_documentBytes == null) {
        if (widget.source.url != null) {
          final http.Response response = await http.get(Uri.parse(widget.source.url!));
          if (response.statusCode == 200) {
            _documentBytes = response.bodyBytes;
          } else {
            UNavigator.snackbar(message: "Failed to download PDF");
            return;
          }
        } else {
          UNavigator.snackbar(message: "Document bytes not available for secure offline save.");
          return;
        }
      }

      final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
      document.security.userPassword = "userpassword@123";
      document.security.ownerPassword = "ownerpassword@123";
      document.security.algorithm = PdfEncryptionAlgorithm.aesx256Bit;
      final Uint8List encryptedBytes = Uint8List.fromList(await document.save());
      document.dispose();

      final String? path = await _saveBytesToAppDoc(encryptedBytes, suggestedName: _fileName);
      if (path != null) {
        setState(() {
          widget.source._replaceWithMemory(encryptedBytes);
          _documentBytes = encryptedBytes;
          _prepareSource();
        });
        UNavigator.snackbar(message: "PDF saved securely at $path");
      } else {
        UNavigator.snackbar(message: "Failed to save PDF locally.");
      }
    } catch (e) {
      UNavigator.snackbar(message: "Failed to save PDF: $e");
    }
  }

  Future<void> _addWatermark() async {
    if (widget.watermarkText == null || widget.watermarkText!.isEmpty) {
      UNavigator.snackbar(message: "No watermark text provided.");
      return;
    }
    if (_documentBytes == null) {
      UNavigator.snackbar(message: "Document bytes not available for watermarking.");
      return;
    }

    try {
      final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
      for (int i = 0; i < document.pages.count; i++) {
        final PdfPage page = document.pages[i];
        final Size pageSize = page.getClientSize();
        final PdfStandardFont font = PdfStandardFont(PdfFontFamily.helvetica, 40);
        final Size size = font.measureString(widget.watermarkText!);
        page.graphics.save();
        page.graphics.translateTransform(pageSize.width / 2, pageSize.height / 2);
        page.graphics.setTransparency(0.25);
        page.graphics.rotateTransform(-45);
        page.graphics.drawString(
          widget.watermarkText!,
          font,
          pen: PdfPen(PdfColor(255, 0, 0)),
          brush: PdfSolidBrush(PdfColor(255, 0, 0)),
          bounds: Rect.fromLTWH(-size.width / 2, -size.height / 2, size.width, size.height),
        );
        page.graphics.restore();
      }

      document.security.userPassword = "userpassword@123";
      document.security.ownerPassword = "ownerpassword@123";
      document.security.algorithm = PdfEncryptionAlgorithm.aesx256Bit;
      final Uint8List newBytes = Uint8List.fromList(await document.save());
      document.dispose();

      final String? path = await _saveBytesToAppDoc(newBytes, suggestedName: _fileName);
      if (path != null) {
        setState(() {
          widget.source._replaceWithMemory(newBytes);
          _documentBytes = newBytes;
          _prepareSource();
        });
        UNavigator.snackbar(message: "PDF saved with watermark at $path");
      } else {
        UNavigator.snackbar(message: "Failed to save watermarked PDF.");
      }
    } catch (e) {
      UNavigator.snackbar(message: "Failed to add watermark: $e");
    }
  }

  void _onTextSelectionChanged(PdfTextSelectionChangedDetails details) {
    _selectedText = details.selectedText;
    _globalSelectedRegion = details.globalSelectedRegion;
    _selectedPageNumber = _controller.pageNumber;

    if (_selectedText != null && _selectedText!.trim().isNotEmpty && _globalSelectedRegion != null) {
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

  Future<void> _addTextMarkupAnnotation(String type) async {
    if (_selectedText == null || _selectedText!.trim().isEmpty) {
      UNavigator.snackbar(message: "No text selected.");
      return;
    }
    if (_documentBytes == null) {
      UNavigator.snackbar(message: "Cannot annotate: document bytes not available.");
      return;
    }

    try {
      final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
      final int pageIndex = _selectedPageNumber - 1;
      if (pageIndex < 0 || pageIndex >= document.pages.count) {
        UNavigator.snackbar(message: "Invalid page for annotation.");
        document.dispose();
        return;
      }

      final PdfTextExtractor extractor = PdfTextExtractor(document);
      final List<TextLine> lines = extractor.extractTextLines(startPageIndex: pageIndex, endPageIndex: pageIndex);
      final String needle = _selectedText!.trim();
      final List<Rect> matchedRects = <Rect>[];

      for (final TextLine line in lines) {
        if (line.text.contains(needle)) {
          matchedRects.add(Rect.fromLTWH(line.bounds.left, line.bounds.top, line.bounds.width, line.bounds.height));
        }
      }

      final PdfPage page = document.pages[pageIndex];
      if (matchedRects.isEmpty) {
        UNavigator.snackbar(message: "Could not resolve selection bounds precisely — adding annotation at top of page.");
        final PdfTextMarkupAnnotation annotation = PdfTextMarkupAnnotation(
          const Rect.fromLTWH(10, 10, 200, 20),
          "Auto $type",
          PdfColor(255, 255, 0),
        )..color = PdfColor(255, 255, 0);
        page.annotations.add(annotation);
      } else {
        final PdfTextMarkupAnnotationType markType = type == "underline"
            ? PdfTextMarkupAnnotationType.underline
            : type == "strike"
                ? PdfTextMarkupAnnotationType.strikethrough
                : PdfTextMarkupAnnotationType.highlight;

        for (final Rect rect in matchedRects) {
          final PdfTextMarkupAnnotation annotation = PdfTextMarkupAnnotation(
            rect,
            "User $type",
            PdfColor(255, 255, 0),
          );
          annotation.textMarkupAnnotationType = markType;
          annotation.color = markType == PdfTextMarkupAnnotationType.highlight ? PdfColor(255, 255, 0) : PdfColor(255, 0, 0);
          annotation.setAppearance = true;
          page.annotations.add(annotation);
        }
      }

      final Uint8List newBytes = Uint8List.fromList(await document.save());
      document.dispose();

      final String? savedPath = await _saveBytesToAppDoc(newBytes, suggestedName: _fileName);
      setState(() {
        widget.source._replaceWithMemory(newBytes);
        _documentBytes = newBytes;
        _prepareSource();
      });

      UNavigator.snackbar(message: savedPath != null ? "Annotation added and saved: $savedPath" : "Annotation added.");
    } catch (e) {
      UNavigator.snackbar(message: "Failed to add annotation: $e");
    }
  }

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
      double x = 50;
      double y = 50;
      if (_globalSelectedRegion != null) {
        x = _globalSelectedRegion!.left;
        y = _globalSelectedRegion!.top;
      }

      final Rect bounds = Rect.fromLTWH(x, y, 20, 20);
      final PdfPopupAnnotation popup = PdfPopupAnnotation(bounds, "Comment")..text = text;
      page.annotations.add(popup);

      final Uint8List newBytes = Uint8List.fromList(await document.save());
      document.dispose();

      final String? savedPath = await _saveBytesToAppDoc(newBytes, suggestedName: _fileName);
      setState(() {
        widget.source._replaceWithMemory(newBytes);
        _documentBytes = newBytes;
        _prepareSource();
      });

      UNavigator.snackbar(message: savedPath != null ? "Comment added and saved: $savedPath" : "Comment added.");
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
                      '${_fileName ?? 'Unknown'}  |  $sizeKB  |  صفحات: $_totalPages',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (widget.enableOfflineDownload)
                    IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: _downloadOffline,
                    ),
                  if (widget.watermarkText != null)
                    IconButton(
                      icon: const Icon(Icons.water_drop),
                      onPressed: _addWatermark,
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
                  widget.source.toSfPdfViewer(
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
                  ),
                if (widget.showLoading && _isLoading && !_hasError) widget.loadingIndicator ?? const Center(child: CircularProgressIndicator()),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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
    void Function(PdfTextSelectionChangedDetails)? onTextSelectionChanged,
  }) {
    if (url != null) {
      return SfPdfViewer.network(
        url!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
        onTextSelectionChanged: onTextSelectionChanged,
      );
    } else if (assetPath != null) {
      return SfPdfViewer.asset(
        assetPath!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
        onTextSelectionChanged: onTextSelectionChanged,
      );
    } else if (bytes != null) {
      return SfPdfViewer.memory(
        bytes!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
        onTextSelectionChanged: onTextSelectionChanged,
      );
    } else if (file != null) {
      return SfPdfViewer.file(
        file!,
        controller: controller,
        initialPageNumber: initialPageNumber,
        initialZoomLevel: initialZoomLevel,
        maxZoomLevel: maxZoomLevel,
        enableDocumentLinkAnnotation: enableAnnotation,
        enableTextSelection: enableTextSelection,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
        onDocumentLoadFailed: onDocumentLoadFailed,
        onTextSelectionChanged: onTextSelectionChanged,
      );
    }
    throw ArgumentError("Invalid PDF source: At least one source type must be provided.");
  }

  void _replaceWithMemory(Uint8List newBytes) {
    bytes = newBytes;
    url = null;
    // assetPath and file remain null
  }
}

enum PdfScrollDirection { vertical, horizontal }

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
          source: PdfViewerSource.network("https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
          controller: _pdfController,
          watermarkText: "CONFIDENTIAL",
          enableOfflineDownload: true,
          onPageChanged: (PdfPageChangedDetails details) {
            debugPrint("Page changed: ${details.newPageNumber}");
          },
          onDocumentLoaded: (PdfDocumentLoadedDetails details) {
            debugPrint("Document loaded, total pages: ${details.document.pages.count}");
          },
          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
            debugPrint("Load failed: ${details.description}");
          },
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

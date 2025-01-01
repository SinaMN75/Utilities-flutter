import 'package:u/utilities.dart';

class Pagination extends StatefulWidget {
  const Pagination({
    required this.numOfPages,
    required this.selectedPage,
    required this.pagesVisible,
    required this.onPageChanged,
    this.activeTextStyle,
    this.activeBtnStyle,
    this.inactiveTextStyle,
    this.inactiveBtnStyle,
    this.previousIcon,
    this.nextIcon,
    this.spacing,
    super.key,
  });

  final int numOfPages;
  final int selectedPage;
  final int pagesVisible;
  final Function onPageChanged;
  final TextStyle? activeTextStyle;
  final ButtonStyle? activeBtnStyle;
  final TextStyle? inactiveTextStyle;
  final ButtonStyle? inactiveBtnStyle;
  final Icon? previousIcon;
  final Icon? nextIcon;
  final double? spacing;

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  late int _startPage;
  late int _endPage;

  @override
  void initState() {
    super.initState();
    _calculateVisiblePages();
  }

  @override
  void didUpdateWidget(final Pagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    _calculateVisiblePages();
  }

  void _calculateVisiblePages() {
    if (widget.numOfPages <= widget.pagesVisible) {
      _startPage = 1;
      _endPage = widget.numOfPages;
    } else {
      final int middle = (widget.pagesVisible - 1) ~/ 2;
      if (widget.selectedPage <= middle + 1) {
        _startPage = 1;
        _endPage = widget.pagesVisible;
      } else if (widget.selectedPage >= widget.numOfPages - middle) {
        _startPage = widget.numOfPages - (widget.pagesVisible - 1);
        _endPage = widget.numOfPages;
      } else {
        _startPage = widget.selectedPage - middle;
        _endPage = widget.selectedPage + middle;
      }
    }
  }

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: widget.previousIcon ?? const Icon(Icons.arrow_back_ios),
            onPressed: widget.selectedPage > 1 ? () => widget.onPageChanged(widget.selectedPage - 1) : null,
          ),
          for (int i = _startPage; i <= _endPage; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: TextButton(
                style: i == widget.selectedPage ? widget.activeBtnStyle : widget.inactiveBtnStyle,
                onPressed: () => widget.onPageChanged(i),
                child: Text('$i', style: i == widget.selectedPage ? widget.activeTextStyle : widget.inactiveTextStyle),
              ).container(
                radius: 100,
                backgroundColor: i == widget.selectedPage ? Theme.of(navigatorKey.currentContext!).colorScheme.primary.withValues(alpha: 0.5) : Colors.transparent,
              ),
            ),
          SizedBox(width: widget.spacing ?? 0),
          IconButton(
            icon: widget.nextIcon ?? const Icon(Icons.arrow_forward_ios),
            onPressed: widget.selectedPage < widget.numOfPages ? () => widget.onPageChanged(widget.selectedPage + 1) : null,
          ),
        ],
      );
}

import 'package:u/utilities.dart';

class UImageSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  final double indicatorHeight;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final double indicatorActiveSize;
  final double indicatorInactiveSize;
  final Duration autoPlayDuration;
  final BoxFit imageFit;
  final double radius;
  final Color imagePlaceholderColor;
  final Widget? errorWidget;

  const UImageSlider({
    super.key,
    required this.images,
    this.height = 200,
    this.indicatorHeight = 30,
    this.activeIndicatorColor = Colors.white,
    this.inactiveIndicatorColor = Colors.grey,
    this.indicatorActiveSize = 10,
    this.indicatorInactiveSize = 8,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.imageFit = BoxFit.cover,
    this.radius = 0,
    this.imagePlaceholderColor = Colors.grey,
    this.errorWidget,
  });

  @override
  State<UImageSlider> createState() => _UImageSliderState();
}

class _UImageSliderState extends State<UImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _stopAutoPlay();
    super.dispose();
  }

  void _startAutoPlay() {
    if (widget.images.length <= 1) return;

    _autoPlayTimer = Timer.periodic(
      widget.autoPlayDuration,
          (dynamic timer) {
        if (_currentPage < widget.images.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: widget.images.length,
        itemBuilder: (BuildContext context, int index) => UImage(
          widget.images[index],
          fit: widget.imageFit,
          borderRadius: widget.radius,
        ).pSymmetric(horizontal: 4),
      ).container(height: widget.height),
      if (widget.images.length > 1)
        SizedBox(
          height: widget.indicatorHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.images.length,
                  (int index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? widget.indicatorActiveSize : widget.indicatorInactiveSize,
                height: _currentPage == index ? widget.indicatorActiveSize : widget.indicatorInactiveSize,
                decoration: BoxDecoration(
                  color: _currentPage == index ? widget.activeIndicatorColor : widget.inactiveIndicatorColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ).alignAtCenter(),
        ),
    ],
  );
}

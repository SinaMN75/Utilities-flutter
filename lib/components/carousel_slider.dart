import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

int getRealIndex(int position, int base, int? length) {
  final int offset = position - base;
  return remainder(offset, length);
}

int remainder(int input, int? source) {
  if (source == 0) return 0;
  final int result = input % source!;
  return result < 0 ? source + result : result;
}

class CarouselState {
  CarouselOptions options;

  PageController? pageController;

  int realPage = 10000;

  int initialPage = 0;

  int? itemCount;

  Function onResetTimer;

  Function onResumeTimer;

  Function(CarouselPageChangedReason) changeMode;

  CarouselState(this.options, this.onResetTimer, this.onResumeTimer, this.changeMode);
}

typedef Widget ExtendedIndexedWidgetBuilder(BuildContext context, int index, int realIndex);

class CarouselSlider extends StatefulWidget {
  final CarouselOptions options;

  final List<Widget>? items;

  final ExtendedIndexedWidgetBuilder? itemBuilder;

  final CarouselControllerImpl _carouselController;

  final int? itemCount;

  CarouselSlider({required this.items, required this.options, CarouselController? carouselController, Key? key})
      : itemBuilder = null,
        itemCount = items != null ? items.length : 0,
        _carouselController = carouselController != null ? carouselController as CarouselControllerImpl : CarouselController() as CarouselControllerImpl,
        super(key: key);

  CarouselSlider.builder({required this.itemCount, required this.itemBuilder, required this.options, CarouselController? carouselController, Key? key})
      : items = null,
        _carouselController = carouselController != null ? carouselController as CarouselControllerImpl : CarouselController() as CarouselControllerImpl,
        super(key: key);

  @override
  CarouselSliderState createState() => CarouselSliderState(_carouselController);
}

class CarouselSliderState extends State<CarouselSlider> with TickerProviderStateMixin {
  final CarouselControllerImpl carouselController;
  Timer? timer;

  CarouselOptions get options => widget.options;

  CarouselState? carouselState;

  PageController? pageController;

  CarouselPageChangedReason mode = CarouselPageChangedReason.controller;

  CarouselSliderState(this.carouselController);

  void changeMode(CarouselPageChangedReason _mode) {
    mode = _mode;
  }

  @override
  void didUpdateWidget(CarouselSlider oldWidget) {
    carouselState!.options = options;
    carouselState!.itemCount = widget.itemCount;

    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState!.realPage,
    );
    carouselState!.pageController = pageController;

    handleAutoPlay();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    carouselState = CarouselState(this.options, clearTimer, resumeTimer, this.changeMode);

    carouselState!.itemCount = widget.itemCount;
    carouselController.state = carouselState;
    carouselState!.initialPage = widget.options.initialPage;
    carouselState!.realPage = options.enableInfiniteScroll ? carouselState!.realPage + carouselState!.initialPage : carouselState!.initialPage;
    handleAutoPlay();

    pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState!.realPage,
    );

    carouselState!.pageController = pageController;
  }

  Timer? getTimer() {
    return widget.options.autoPlay
        ? Timer.periodic(widget.options.autoPlayInterval, (_) {
            final route = ModalRoute.of(context);
            if (route?.isCurrent == false) {
              return;
            }

            CarouselPageChangedReason previousReason = mode;
            changeMode(CarouselPageChangedReason.timed);
            int nextPage = carouselState!.pageController!.page!.round() + 1;
            int itemCount = widget.itemCount ?? widget.items!.length;

            if (nextPage >= itemCount && widget.options.enableInfiniteScroll == false) {
              if (widget.options.pauseAutoPlayInFiniteScroll) {
                clearTimer();
                return;
              }
              nextPage = 0;
            }

            carouselState!.pageController!.animateToPage(nextPage, duration: widget.options.autoPlayAnimationDuration, curve: widget.options.autoPlayCurve).then((_) => changeMode(previousReason));
          })
        : null;
  }

  void clearTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  void resumeTimer() {
    if (timer == null) {
      timer = getTimer();
    }
  }

  void handleAutoPlay() {
    bool autoPlayEnabled = widget.options.autoPlay;

    if (autoPlayEnabled && timer != null) return;

    clearTimer();
    if (autoPlayEnabled) {
      resumeTimer();
    }
  }

  Widget getGestureWrapper(Widget child) {
    Widget wrapper;
    if (widget.options.height != null) {
      wrapper = Container(height: widget.options.height, child: child);
    } else {
      wrapper = AspectRatio(aspectRatio: widget.options.aspectRatio, child: child);
    }

    return RawGestureDetector(
      gestures: {
        _MultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<_MultipleGestureRecognizer>(() => _MultipleGestureRecognizer(), (_MultipleGestureRecognizer instance) {
          instance.onStart = (_) {
            onStart();
          };
          instance.onDown = (_) {
            onPanDown();
          };
          instance.onEnd = (_) {
            onPanUp();
          };
          instance.onCancel = () {
            onPanUp();
          };
        }),
      },
      child: NotificationListener(
        onNotification: (Notification notification) {
          if (widget.options.onScrolled != null && notification is ScrollUpdateNotification) {
            widget.options.onScrolled!(carouselState!.pageController!.page);
          }
          return false;
        },
        child: wrapper,
      ),
    );
  }

  Widget getCenterWrapper(Widget child) {
    if (widget.options.disableCenter) {
      return Container(
        child: child,
      );
    }
    return Center(child: child);
  }

  Widget getEnlargeWrapper(Widget? child, {double? width, double? height, double? scale}) {
    if (widget.options.enlargeStrategy == CenterPageEnlargeStrategy.height) {
      return SizedBox(child: child, width: width, height: height);
    }
    return Transform.scale(scale: scale!, child: Container(child: child, width: width, height: height));
  }

  void onStart() {
    changeMode(CarouselPageChangedReason.manual);
  }

  void onPanDown() {
    if (widget.options.pauseAutoPlayOnTouch) {
      clearTimer();
    }

    changeMode(CarouselPageChangedReason.manual);
  }

  void onPanUp() {
    if (widget.options.pauseAutoPlayOnTouch) {
      resumeTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearTimer();
  }

  @override
  Widget build(BuildContext context) {
    return getGestureWrapper(PageView.builder(
      padEnds: widget.options.padEnds,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        overscroll: false,
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      clipBehavior: widget.options.clipBehavior,
      physics: widget.options.scrollPhysics,
      scrollDirection: widget.options.scrollDirection,
      pageSnapping: widget.options.pageSnapping,
      controller: carouselState!.pageController,
      reverse: widget.options.reverse,
      itemCount: widget.options.enableInfiniteScroll ? null : widget.itemCount,
      key: widget.options.pageViewKey,
      onPageChanged: (int index) {
        int currentPage = getRealIndex(index + carouselState!.initialPage, carouselState!.realPage, widget.itemCount);
        if (widget.options.onPageChanged != null) {
          widget.options.onPageChanged!(currentPage, mode);
        }
      },
      itemBuilder: (BuildContext context, int idx) {
        final int index = getRealIndex(idx + carouselState!.initialPage, carouselState!.realPage, widget.itemCount);

        return AnimatedBuilder(
          animation: carouselState!.pageController!,
          child: (widget.items != null) ? (widget.items!.length > 0 ? widget.items![index] : Container()) : widget.itemBuilder!(context, index, idx),
          builder: (BuildContext context, child) {
            double distortionValue = 1.0;

            if (widget.options.enlargeCenterPage != null && widget.options.enlargeCenterPage == true) {
              double itemOffset = 0;
              var position = carouselState?.pageController?.position;
              if (position != null && position.hasPixels && position.hasContentDimensions) {
                var _page = carouselState?.pageController?.page;
                if (_page != null) {
                  itemOffset = _page - idx;
                }
              } else {
                BuildContext storageContext = carouselState!.pageController!.position.context.storageContext;
                final double? previousSavedPosition = PageStorage.of(storageContext)?.readState(storageContext) as double?;
                if (previousSavedPosition != null) {
                  itemOffset = previousSavedPosition - idx.toDouble();
                } else {
                  itemOffset = carouselState!.realPage.toDouble() - idx.toDouble();
                }
              }

              final num distortionRatio = (1 - (itemOffset.abs() * 0.3)).clamp(0.0, 1.0);
              distortionValue = Curves.easeOut.transform(distortionRatio as double);
            }

            final double height = widget.options.height ?? MediaQuery.of(context).size.width * (1 / widget.options.aspectRatio);

            if (widget.options.scrollDirection == Axis.horizontal) {
              return getCenterWrapper(getEnlargeWrapper(child, height: distortionValue * height, scale: distortionValue));
            } else {
              return getCenterWrapper(getEnlargeWrapper(child, width: distortionValue * MediaQuery.of(context).size.width, scale: distortionValue));
            }
          },
        );
      },
    ));
  }
}

class _MultipleGestureRecognizer extends PanGestureRecognizer {}

abstract class CarouselController {
  bool get ready;

  Future<Null> get onReady;

  Future<void> nextPage({Duration? duration, Curve? curve});

  Future<void> previousPage({Duration? duration, Curve? curve});

  void jumpToPage(int page);

  Future<void> animateToPage(int page, {Duration? duration, Curve? curve});

  void startAutoPlay();

  void stopAutoPlay();

  factory CarouselController() => CarouselControllerImpl();
}

class CarouselControllerImpl implements CarouselController {
  final Completer<Null> _readyCompleter = Completer<Null>();

  CarouselState? _state;

  set state(CarouselState? state) {
    _state = state;
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  void _setModeController() => _state!.changeMode(CarouselPageChangedReason.controller);

  @override
  bool get ready => _state != null;

  @override
  Future<Null> get onReady => _readyCompleter.future;

  Future<void> nextPage({Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!.nextPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  Future<void> previousPage({Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!.previousPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  void jumpToPage(int page) {
    final index = getRealIndex(_state!.pageController!.page!.toInt(), _state!.realPage - _state!.initialPage, _state!.itemCount);

    _setModeController();
    final int pageToJump = _state!.pageController!.page!.toInt() + page - index;
    return _state!.pageController!.jumpToPage(pageToJump);
  }

  Future<void> animateToPage(int page, {Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    final index = getRealIndex(_state!.pageController!.page!.toInt(), _state!.realPage - _state!.initialPage, _state!.itemCount);
    _setModeController();
    await _state!.pageController!.animateToPage(_state!.pageController!.page!.toInt() + page - index, duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  void startAutoPlay() {
    _state!.onResumeTimer();
  }

  void stopAutoPlay() {
    _state!.onResetTimer();
  }
}

enum CarouselPageChangedReason { timed, manual, controller }

enum CenterPageEnlargeStrategy { scale, height }

class CarouselOptions {
  final double? height;

  final double aspectRatio;

  final double viewportFraction;

  final int initialPage;

  final bool enableInfiniteScroll;

  final bool reverse;

  final bool autoPlay;

  final Duration autoPlayInterval;

  final Duration autoPlayAnimationDuration;

  final Curve autoPlayCurve;

  final bool? enlargeCenterPage;

  final Axis scrollDirection;

  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  final ValueChanged<double?>? onScrolled;

  final ScrollPhysics? scrollPhysics;

  final bool pageSnapping;

  final bool pauseAutoPlayOnTouch;

  final bool pauseAutoPlayOnManualNavigate;

  final bool pauseAutoPlayInFiniteScroll;

  final PageStorageKey? pageViewKey;

  final CenterPageEnlargeStrategy enlargeStrategy;

  final bool disableCenter;

  final bool padEnds;

  final Clip clipBehavior;

  CarouselOptions({
    this.height,
    this.aspectRatio: 16 / 9,
    this.viewportFraction: 0.8,
    this.initialPage: 0,
    this.enableInfiniteScroll: true,
    this.reverse: false,
    this.autoPlay: false,
    this.autoPlayInterval: const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve: Curves.fastOutSlowIn,
    this.enlargeCenterPage = false,
    this.onPageChanged,
    this.onScrolled,
    this.scrollPhysics,
    this.pageSnapping = true,
    this.scrollDirection: Axis.horizontal,
    this.pauseAutoPlayOnTouch: true,
    this.pauseAutoPlayOnManualNavigate: true,
    this.pauseAutoPlayInFiniteScroll: false,
    this.pageViewKey,
    this.enlargeStrategy: CenterPageEnlargeStrategy.scale,
    this.disableCenter: false,
    this.padEnds = true,
    this.clipBehavior: Clip.hardEdge,
  });

  CarouselOptions copyWith({double? height, double? aspectRatio, double? viewportFraction, int? initialPage, bool? enableInfiniteScroll, bool? reverse, bool? autoPlay, Duration? autoPlayInterval, Duration? autoPlayAnimationDuration, Curve? autoPlayCurve, bool? enlargeCenterPage, Function(int index, CarouselPageChangedReason reason)? onPageChanged, ValueChanged<double?>? onScrolled, ScrollPhysics? scrollPhysics, bool? pageSnapping, Axis? scrollDirection, bool? pauseAutoPlayOnTouch, bool? pauseAutoPlayOnManualNavigate, bool? pauseAutoPlayInFiniteScroll, PageStorageKey? pageViewKey, CenterPageEnlargeStrategy? enlargeStrategy, bool? disableCenter, Clip? clipBehavior, bool? padEnds}) => CarouselOptions(
        height: height ?? this.height,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        viewportFraction: viewportFraction ?? this.viewportFraction,
        initialPage: initialPage ?? this.initialPage,
        enableInfiniteScroll: enableInfiniteScroll ?? this.enableInfiniteScroll,
        reverse: reverse ?? this.reverse,
        autoPlay: autoPlay ?? this.autoPlay,
        autoPlayInterval: autoPlayInterval ?? this.autoPlayInterval,
        autoPlayAnimationDuration: autoPlayAnimationDuration ?? this.autoPlayAnimationDuration,
        autoPlayCurve: autoPlayCurve ?? this.autoPlayCurve,
        enlargeCenterPage: enlargeCenterPage ?? this.enlargeCenterPage,
        onPageChanged: onPageChanged ?? this.onPageChanged,
        onScrolled: onScrolled ?? this.onScrolled,
        scrollPhysics: scrollPhysics ?? this.scrollPhysics,
        pageSnapping: pageSnapping ?? this.pageSnapping,
        scrollDirection: scrollDirection ?? this.scrollDirection,
        pauseAutoPlayOnTouch: pauseAutoPlayOnTouch ?? this.pauseAutoPlayOnTouch,
        pauseAutoPlayOnManualNavigate: pauseAutoPlayOnManualNavigate ?? this.pauseAutoPlayOnManualNavigate,
        pauseAutoPlayInFiniteScroll: pauseAutoPlayInFiniteScroll ?? this.pauseAutoPlayInFiniteScroll,
        pageViewKey: pageViewKey ?? this.pageViewKey,
        enlargeStrategy: enlargeStrategy ?? this.enlargeStrategy,
        disableCenter: disableCenter ?? this.disableCenter,
        clipBehavior: clipBehavior ?? this.clipBehavior,
        padEnds: padEnds ?? this.padEnds,
      );
}

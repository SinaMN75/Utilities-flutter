import 'package:flutter/material.dart';
import 'package:utilities/components/flip_cart/flip_card.dart';
import 'package:utilities/utilities.dart';

class FlipCardController {
  FlipCardState? state;
  AnimationController? get controller {
    assert(state != null,
        'Controller not attached to any FlipCard. Did you forget to pass the controller to the FlipCard?');
    return state!.controller;
  }

  Future<void> toggleCard() async => await state?.toggleCard();

  void toggleCardWithoutAnimation() => state?.toggleCardWithoutAnimation();

  Future<void> skew(double amount, {Duration? duration, Curve? curve}) async {
    assert(0 <= amount && amount <= 1);

    final target = state!.isFront ? amount : 1 - amount;
    await controller
        ?.animateTo(target, duration: duration, curve: curve ?? Curves.linear)
        .asStream()
        .first;
  }

  Future<void> hint({Duration? duration, Duration? total}) async {
    assert(controller is AnimationController);
    if (!(controller is AnimationController)) return;

    if (controller!.isAnimating || controller!.value != 0) return;

    final durationTotal = total ?? controller!.duration;

    final completer = Completer();

    Duration? original = controller!.duration;
    controller!.duration = durationTotal;
    controller!.forward();

    final durationFlipBack = duration ?? const Duration(milliseconds: 150);

    Timer(durationFlipBack, () {
      controller!.reverse().whenComplete(() {
        completer.complete();
      });
      controller!.duration = original;
    });

    await completer.future;
  }
}

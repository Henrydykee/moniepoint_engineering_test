import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimation on Widget {
  Animate _applyAnimation({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    Offset? offset,
    double? scaleBegin,
    double? slideBegin,
    double? slideEnd,
    bool fade = false,
  }) {
    final animation = animate(delay: delay ?? 300.ms);

    if (offset != null) {
      animation.move(
        duration: animationDuration ?? 300.ms,
        begin: offset,
      );
    }

    if (fade) {
      animation.fade(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.decelerate,
      );
    }

    if (scaleBegin != null) {
      animation.scale(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.easeOut,
        begin: offset,
      );
    }

    if (slideBegin != null && slideEnd != null) {
      animation.slideY(
        duration: animationDuration ?? 300.ms,
        begin: slideBegin,
        end: slideEnd,
        curve: curve ?? Curves.linear,
      );
    }

    return animation;
  }

  Animate fadeInFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        offset: offset ?? const Offset(0, -10),
        fade: true,
      );

  Animate fadeInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        offset: offset ?? const Offset(0, 10),
        fade: true,
      );

  Animate fadeInFromLeft({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        offset: offset ?? const Offset(-10, 0),
        fade: true,
      );

  Animate fadeInFromRight({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        offset: offset ?? const Offset(10, 0),
        fade: true,
      );

  Animate fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        curve: curve,
        fade: true,
      );

  Animate scale({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        curve: curve,
        scaleBegin: 1.0,
      );
  Animate slideInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      _applyAnimation(
        delay: delay,
        animationDuration: animationDuration,
        curve: curve,
        slideBegin: begin ?? 0.2,
        slideEnd: 0,
      );
}

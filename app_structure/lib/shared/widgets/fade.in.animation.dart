// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

enum FadeDirection {
  startToEnd,
  endToStart,
  topToBottom,
  bottomToTop,
}

class FadeIn extends StatefulWidget {
  const FadeIn({
    super.key,
    this.fadeDirection = FadeDirection.startToEnd,
    this.offset = .3,
    this.controller,
    this.duration,
    this.curve = const Interval(.1, .3, curve: Curves.easeOut),
    required this.child,
  })  : assert(
          controller == null && duration != null ||
              controller != null && duration == null,
          'Controller or duration is required',
        ),
        assert(
          offset > 0,
          'offset greater than 0 is required',
        );

  /// [FadeIn] animation can be controlled via external [controller]. If
  /// [controller] is not provided, it will use the default internal controller
  /// which will run the animation in initState()
  final AnimationController? controller;
  final FadeDirection fadeDirection;
  final double offset;
  final Widget child;
  final Duration? duration;
  final Curve curve;

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      );
    }

    _updateAnimations();
    _controller?.forward();
  }

  void _updateAnimations() {
    Offset? begin;
    Offset? end;
    final offset = widget.offset;

    switch (widget.fadeDirection) {
      case FadeDirection.startToEnd:
        begin = Offset(-offset, 0);
        end = Offset.zero;
        break;
      case FadeDirection.endToStart:
        begin = Offset(offset, 0);
        end = Offset.zero;
        break;
      case FadeDirection.topToBottom:
        begin = Offset(0, -offset);
        end = Offset.zero;
        break;
      case FadeDirection.bottomToTop:
        begin = Offset(0, offset);
        end = Offset.zero;
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _effectiveController!,
        curve: widget.curve,
      ),
    );
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _effectiveController!,
        curve: widget.curve,
      ),
    );
  }

  AnimationController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }
}

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == '/login') {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class CustomAnimationDemo extends StatefulWidget {
  CustomAnimationDemo(
      {Key key,
      @required this.decoration,
      this.child,
      this.curve = Curves.linear,
      this.duration,
      this.reverseDuration})
      : super(key: key);

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _CustomAnimationDemoState createState() => _CustomAnimationDemoState();
}

class _CustomAnimationDemoState extends State<CustomAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  DecorationTween _tween;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("223");
    _controller = AnimationController(
        duration: widget.duration,
        vsync: this,
        reverseDuration: widget.reverseDuration);
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: widget.child,
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: _tween.animate(_animation).value,
            child: child,
          );
        });
  }

  @override
  void didUpdateWidget(CustomAnimationDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }

    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;

    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;

      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
    Duration reverseDuration, // 反向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

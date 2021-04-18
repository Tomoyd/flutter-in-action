import 'package:flutter/material.dart';

class AnimatedExpend extends StatefulWidget {
  final Widget child;
  AnimatedExpend({Key key, this.child}) : super(key: key);

  @override
  _AnimatedExpendState createState() => _AnimatedExpendState();
}

class _AnimatedExpendState extends State<AnimatedExpend>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    // TODO: implement initState
    super.initState();
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    _animationController.reset();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.reset();

    _animationController.forward();
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: _animationController,
      child: widget.child,
    );
  }
}

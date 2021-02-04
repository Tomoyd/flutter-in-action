import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class SwitcherDemo extends StatefulWidget {
  SwitcherDemo({Key key}) : super(key: key);

  @override
  _SwitcherDemoState createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "switcher切换组件",
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (child, ani) {
                  return SlideTransitionOffset(child: child, position: ani);
                  //  var tween =
                  //       Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                  // return MySlideTransition(
                  //   position: tween.animate(ani),
                  //   child: child,
                  // );
                  // return SlideTransition(
                  //   position: tween.animate(ani),
                  //   child: child,
                  // );
                  // return ScaleTransition(child: child, scale: ani);
                },
                child: Text(
                  "$_count",
                  key: ValueKey(_count),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Text("++"),
              )
            ],
          )),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class SlideTransitionOffset extends AnimatedWidget {
  SlideTransitionOffset(
      {Key key,
      @required Animation<double> position,
      this.transformHitTest = true,
      this.direction = AxisDirection.down,
      this.child})
      : super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;

      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }
  Animation<double> get position => listenable;
  final bool transformHitTest;
  final Widget child;
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        default:
      }
    }

    // TODO: implement build
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTest,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  TransformPage({Key key}) : super(key: key);

  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  double maxSlide = 20.0;
  AnimationController _animationController;
  bool _canBeDragged = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  _handleDragStart(DragStartDetails details) {
    bool isDragFromOpenFromLeft =
        _animationController.isDismissed && details.globalPosition.dx < 50;
    bool isDragFromCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > MediaQuery.of(context).size.width - 50;

    _canBeDragged = isDragFromCloseFromRight || isDragFromOpenFromLeft;
  }

  _handleDrageUpdate(details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / 225;
      _animationController.value += delta;
    }
  }

  _handleDragEnd(details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() > 365) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  _handleToggle() {
    switch (_animationController.status) {
      case AnimationStatus.completed:
        _animationController.reverse();
        break;
      case AnimationStatus.dismissed:
        _animationController.forward();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var myDrawer = Container(color: Colors.blue);
    var myChild = Container(color: Colors.yellow);
    return GestureDetector(
        onHorizontalDragStart: _handleDragStart,
        onHorizontalDragUpdate: _handleDrageUpdate,
        onHorizontalDragEnd: _handleDragEnd,
        onTap: _handleToggle,
        child: Stack(children: [
          myDrawer,
          AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double slide = _animationController.value * maxSlide;
                double scale = 1 - (_animationController.value * 0.5);
                return Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  child: myChild,
                );
              })
        ]));
  }
}

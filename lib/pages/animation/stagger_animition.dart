import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

// 交织动画
class StaggerAnimationDemo extends StatefulWidget {
  StaggerAnimationDemo({Key key}) : super(key: key);

  @override
  _StaggerAnimationDemoState createState() => _StaggerAnimationDemoState();
}

class _StaggerAnimationDemoState extends State<StaggerAnimationDemo>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      await animationController.forward().orCancel;

      await animationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "交织动画",
        body: GestureDetector(
          onTap: () {
            _playAnimation();
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.grey,
            child: StaggerAnimationItem(controller: animationController),
          ),
        ));
  }
}

class StaggerAnimationItem extends StatelessWidget {
  StaggerAnimationItem({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.yellow, end: Colors.yellow).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0, 0.6, curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 20.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0, 0.6, curve: Curves.ease)));
  }

  final AnimationController controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            alignment: Alignment.bottomLeft,
            padding: padding.value,
            child: Container(
              color: color.value,
              width: 50,
              height: height.value,
              child: Text("1234"),
            ),
          );
        });
  }
}

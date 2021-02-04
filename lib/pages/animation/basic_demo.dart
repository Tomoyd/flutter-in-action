import 'package:flutter/material.dart';
import 'package:myapp/pages/animation/custom_animation_container.dart';
import 'package:myapp/pages/animation/hero_ani.dart';
import 'package:myapp/pages/animation/stagger_animition.dart';
import 'package:myapp/pages/animation/switcher_widget.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class BasicAnimationDemo extends StatefulWidget {
  BasicAnimationDemo({Key key}) : super(key: key);

  @override
  _BasicAnimationDemoState createState() => _BasicAnimationDemoState();
}

class _BasicAnimationDemoState extends State<BasicAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 100.0).animate(animation)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.dismissed:
            print("开始处停止");
            break;
          case AnimationStatus.reverse:
            print("反向执行动画中");
            break;
          case AnimationStatus.forward:
            print("正向执行动画中");
            break;
          case AnimationStatus.completed:
            print("正向执行结束");
            break;
          default:
        }
      });

    controller.forward();
  }

  Color _dColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (animation.value == 100.0) {
              return controller.reverse();
            }
            return controller.forward();
          },
          child: AnimatedImage(
            animation: animation,
          ),
        ),
        AnimatedBuilder(
            animation: animation,
            child: Text("AB"),
            builder: (ctx, child) {
              return Container(
                color: Colors.blueAccent,
                height: animation.value,
                width: animation.value,
                child: child,
              );
            }),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, FadeRoute(builder: (context) {
              return CommonScaffold(
                title: 'Route animation',
                body: Text("1999"),
              );
            }));
          },
          child: Text("路由过渡"),
        ),
        HeroAnimationDemo(),
        RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, an1, an2) {
                return FadeTransition(
                    opacity: an1, child: StaggerAnimationDemo());
              }));
            },
            child: Text("交织动画")),
        RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, an1, an2) {
                return FadeTransition(opacity: an1, child: SwitcherDemo());
              }));
            },
            child: Text("Animation Switcher")),
        CustomAnimationDemo(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(color: _dColor),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _dColor = Colors.red;
              });
            },
            child: Text("custom Animation"),
          ),
        ),
        AnimatedDecoratedBox(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(color: _dColor),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _dColor = Colors.yellow;
              });
            },
            child: Text("AnimatedDecoratedBox"),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return ClipOval(
        child: Image.asset(
      "assets/images/no_picture.png",
      width: animation.value,
      height: animation.value,
      fit: BoxFit.cover,
    ));
  }
}

class FadeRoute extends PageRoute {
  FadeRoute(
      {@required this.builder,
      this.barrierColor,
      this.barrierLabel,
      this.maintainState = true,
      this.transitionDuration = const Duration(milliseconds: 300)});

  final WidgetBuilder builder;

  @override
  // TODO: implement barrierColor
  final Color barrierColor;

  @override
  // TODO: implement barrierLabel
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }

  @override
  // TODO: implement maintainState
  final bool maintainState;

  @override
  // TODO: implement transitionDuration
  final Duration transitionDuration;
}

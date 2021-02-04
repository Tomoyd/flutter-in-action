import 'package:flutter/material.dart';
import 'package:myapp/pages/animation/basic_demo.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class AnimationDemo extends StatefulWidget {
  AnimationDemo({Key key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "Animation Demo",
      body: Column(
        children: <Widget>[BasicAnimationDemo()],
      ),
    );
  }
}

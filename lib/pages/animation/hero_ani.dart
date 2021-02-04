import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class HeroAnimationDemo extends StatefulWidget {
  HeroAnimationDemo({Key key}) : super(key: key);

  @override
  _HeroAnimationDemoState createState() => _HeroAnimationDemoState();
}

class _HeroAnimationDemoState extends State<HeroAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, animation, sedAni) {
              return FadeTransition(
                  opacity: animation,
                  child: CommonScaffold(
                    title: "Hero",
                    body: ClipOval(
                        child: Hero(
                            tag: "avatar",
                            child: Image.asset(
                              "assets/images/no_picture.png",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ))),
                  ));
            }));
          },
          icon: Hero(
              tag: "avatar",
              child: Image.asset(
                "assets/images/no_picture.png",
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              )),
          label: Text("hero 动画")),
    );
  }
}

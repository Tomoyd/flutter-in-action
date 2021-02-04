import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class GestureDemo extends StatefulWidget {
  GestureDemo({Key key}) : super(key: key);

  @override
  _GestureDemoState createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo>
    with SingleTickerProviderStateMixin {
  String _operation = "No Gesture Detected";
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _width = 200;

  void updateText(BuildContext context, String msg) {
    (context as Element).markNeedsBuild();
    _operation = msg;
  }

  void updatePosition(BuildContext context, DragUpdateDetails e) {
    (context as Element).markNeedsBuild();
    _top += e.delta.dy;
    _left += e.delta.dx;
  }

  @override
  Widget build(BuildContext context) {
    print("22222");
    return CommonScaffold(
      title: "手势识别",
      body: Stack(
        children: <Widget>[
          Expanded(child: Container()),
          Builder(builder: (context) {
            return GestureDetector(
                onDoubleTap: () {
                  updateText(context, "doubleTap");
                },
                onLongPress: () {
                  updateText(context, "onLongPress");
                },
                onTap: () {
                  updateText(context, "tab");
                },
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                  child: Text(_operation),
                ));
          }),
          Builder(builder: (context) {
            return GestureDetector(
              onScaleStart: (ScaleStartDetails d) {
                print("scale start");
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                _width = 200 * details.scale.clamp(0, 10.0);
                (context as Element).markNeedsBuild();
                // _width = 160;
              },
              child: Image.asset(
                "assets/images/no_picture.png",
                width: _width,
              ),
            );
          }),
          Builder(builder: (context) {
            return Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  onPanDown: (e) {
                    print("doubleTap");
                  },
                  onPanUpdate: (e) {
                    updatePosition(context, e);
                  },
                  onPanEnd: (e) {
                    print(e.velocity);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: Text(
                        "A",
                      )),
                ));
          })
        ],
      ),
    );
  }
}

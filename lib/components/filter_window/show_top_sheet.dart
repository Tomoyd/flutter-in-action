import 'package:flutter/material.dart';

class TopSheetModal extends StatefulWidget {
  TopSheetModal({Key key, this.child, this.top = 0}) : super(key: key);
  final Widget child;
  final double top;
  @override
  _TopSheetModalState createState() => _TopSheetModalState();
}

class _TopSheetModalState extends State<TopSheetModal>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Color color = Color(0x2f000000);
  GlobalKey contentKey = GlobalKey();
  double childHeight = 0;
  double get _childHeight {
    try {
      final RenderBox renderBox = contentKey.currentContext.findRenderObject();
      return renderBox.size.height;
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    // final RenderBox renderBox = contentKey.currentContext.findRenderObject();

    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    Future.delayed(Duration(milliseconds: 30)).then((value) {
      setState(() {
        childHeight = _childHeight;
      });
      animation = Tween(begin: 0.0, end: _childHeight).animate(animation)
        ..addStatusListener((status) {
          switch (status) {
            case AnimationStatus.dismissed:
              print("开始处停止");
              Navigator.of(context).pop();
              break;
            case AnimationStatus.forward:
              print("正向执行动画中");
              break;
            default:
          }
        });
      controller.forward();
    });
  }

  onBack() {
    controller.reverse();
    Future.delayed(Duration(milliseconds: 20)).then((value) => setState(() {
          color = Colors.transparent;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
          onTap: onBack,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                  child: Container(
                margin: EdgeInsets.only(top: widget.top),
                alignment: Alignment.topLeft,
                child: childHeight == 0
                    ? Opacity(
                        key: contentKey,
                        opacity: 0,
                        child: widget.child,
                      )
                    : Column(children: [
                        GestureDetector(
                            onTap: () {},
                            child: AnimatedBuilder(
                                animation: animation,
                                child: widget.child,
                                builder: (ctx, child) {
                                  return Container(
                                    color: Colors.white,
                                    alignment: Alignment.topLeft,
                                    height: animation.value,
                                    child: child,
                                  );
                                })),
                        Expanded(
                            child: Container(
                          color: color,
                        ))
                      ]),
              )))),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

showTopSheet(
  BuildContext context, {
  bool fromTop = false,
  @required Widget content,
}) {
  double height = 0;
  if (!fromTop) {
    try {
      height = Scaffold.of(context).widget.appBar?.preferredSize?.height ?? 0;
    } catch (e) {
      height = 0;
    }
    height += context.size.height;
  }

  Navigator.of(context).push(
    PageRouteBuilder(
        pageBuilder: (context, ani_1, ani_2) {
          return TopSheetModal(top: height, child: content);
        },
        opaque: false),
  );
}

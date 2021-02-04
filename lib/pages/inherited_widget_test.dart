import 'package:flutter/material.dart';

class InheritedWidgetTest extends StatefulWidget {
  InheritedWidgetTest({Key key}) : super(key: key);

  @override
  _InheritedWidgetTestState createState() => _InheritedWidgetTestState();
}

class _InheritedWidgetTestState extends State<InheritedWidgetTest> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      ShareDataWidget(
        index: _count,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _TestWidget(),
        ),
      ),
      RaisedButton(
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
          child: Text("++"))
    ]));
  }
}

class _TestWidget extends StatefulWidget {
  _TestWidget({Key key}) : super(key: key);

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(ShareDataWidget.of(context).index.toString()),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.index,
    Widget child,
  }) : super(child: child);
  final int index;

  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.index != index;
  }
}

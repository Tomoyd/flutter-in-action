import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class ListenerWidgetDemo extends StatefulWidget {
  ListenerWidgetDemo({Key key}) : super(key: key);

  @override
  _ListenerWidgetDemoState createState() => _ListenerWidgetDemoState();
}

class _ListenerWidgetDemoState extends State<ListenerWidgetDemo> {
  PointerEvent _pointerEvent;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "Pointer event",
        body: Builder(
          builder: (context) {
            return Listener(
              child: Container(
                width: 300,
                height: 200,
                color: Colors.orange,
                child: Text(_pointerEvent?.toString() ?? "click"),
              ),
              onPointerDown: (event) {
                setState(() {
                  _pointerEvent = event;
                });
              },
              onPointerMove: (event) {
                setState(() {
                  _pointerEvent = event;
                });
              },
              onPointerUp: (event) {
                setState(() {
                  _pointerEvent = event;
                });
              },
            );
          },
        ));
  }
}

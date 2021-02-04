import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class EventBusDemo extends StatefulWidget {
  EventBusDemo({Key key}) : super(key: key);

  @override
  _EventBusDemoState createState() => _EventBusDemoState();
}

class _EventBusDemoState extends State<EventBusDemo> {
  var _eventBus = new EventBus();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventBus.on("press", (arg) {
      print("有人press了");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eventBus.off("press");
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "事件总线",
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _eventBus.emit("press", "1244");
            },
            child: Text("emit"),
          )
        ],
      ),
    );
  }
}
//

typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback cb) {
    if (eventName == null || cb == null) return;

    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(cb);
  }

  void off(eventName, [EventCallback cb]) {
    var eList = _emap[eventName];
    if (eventName == null || eList == null) return;

    if (cb == null) {
      return _emap[eventName] = null;
    }

    eList.remove(cb);
  }

  void emit(eventName, [arg]) {
    print(eventName);
    var eList = _emap[eventName];
    if (eList == null) return;

    int len = eList.length - 1;

    for (var i = len; i > -1; --i) {
      eList[i](arg);
    }
  }
}

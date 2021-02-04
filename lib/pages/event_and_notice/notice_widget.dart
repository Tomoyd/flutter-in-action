import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class NotificationDemo extends StatefulWidget {
  NotificationDemo({Key key}) : super(key: key);

  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "Notice Demo",
        body: NotificationListener(
          onNotification: (notification) {
            print(notification.runtimeType);
            return true;
          },
          child: NotificationListener(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  print("start");

                  return true;
                case MyNotification:
                  print("msg>>>${notification.msg}");
                  return false;
                default:
                  return true;
              }
            },
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return CustomNotify(msg: "$index");
                }),
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class CustomNotify extends StatelessWidget {
  final String msg;
  const CustomNotify({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.msg ?? "无"),
      onTap: () {
        MyNotification(this.msg).dispatch(context);
      },
    );
  }
}

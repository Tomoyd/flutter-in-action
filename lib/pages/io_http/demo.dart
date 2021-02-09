import 'package:flutter/material.dart';
import 'package:myapp/pages/io_http/dio_demo.dart';
import 'package:myapp/pages/io_http/file_operation.dart';
import 'package:myapp/pages/io_http/http_client.dart';
import 'package:myapp/pages/io_http/webSocket.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class IOHttpDemo extends StatelessWidget {
  const IOHttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "IOHttpDemo",
      body: Column(
        children: <Widget>[
          FileOperation(),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HttpClientWidget();
                }));
              },
              child: Text("http client网络请请求")),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DioDemo();
                }));
              },
              child: Text("Dio 请求")),
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebSocketDemo();
                }));
              },
              child: Text("WebSocket"))
        ],
      ),
    );
  }
}

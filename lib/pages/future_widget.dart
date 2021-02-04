import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  bool _isFutureBuilder = true;
  Map<bool, Widget> widgetMap = {
    true: FutureBuilderDemo(),
    false: StreamBuilderDemo()
  };
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "future builder 和stream_builder",
      rightAction: Switch(
          activeColor: Colors.blue,
          value: _isFutureBuilder,
          onChanged: (value) {
            setState(() {
              _isFutureBuilder = value;
            });
          }),
      body: Center(
        child: widgetMap[_isFutureBuilder],
      ),
    );
  }
}

class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 5), () => "我是假数据"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("has Error");
            } else {
              return Text("Contents:${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class StreamBuilderDemo extends StatefulWidget {
  StreamBuilderDemo({Key key}) : super(key: key);

  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: counter().take(5),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("无Stream");
          case ConnectionState.waiting:
            return Text("正在加载数据...");
          case ConnectionState.active:
            return Text("数据active...");
          case ConnectionState.done:
            return Text("加载完毕");
          default:
            return Text("不可能出现我");
        }
      },
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    print("iiiiiii>>>>$i");
    if (i == 5) {
      return null;
    }
    return i;
  });
}

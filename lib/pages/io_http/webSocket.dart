import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/widgets/common_scaffold.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketDemo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    IOWebSocketChannel channel;
    final load = useState<bool>(true);

    initChannel() async {
      channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
      print("channel**********$channel");
      // load.setState(false);
    }

    initChannel();

    useEffect(() {
      return () {
        channel.sink.close();
      };
    }, []);
    // TODO: implement build
    return CommonScaffold(
      title: "WebSocketDemo",
      body: load.state
          ? CircularProgressIndicator()
          : Column(children: [
              FlatButton(
                  onPressed: () {
                    channel.sink.add("hello");
                  },
                  child: Text("send message")),
              StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  String _text = "";
                  //网络不通会走到这
                  if (snapshot.hasError) {
                    _text = "网络不通...";
                  } else if (snapshot.hasData) {
                    _text = "echo: " + snapshot.data;
                  }
                  return new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: new Text(_text),
                  );
                },
              )
            ]),
    );
  }
}

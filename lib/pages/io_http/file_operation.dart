import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/widgets/common_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class FileOperation extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    Future<File> _getLocalFile() async {
      // 获取应用目录
      String dir = (await getApplicationDocumentsDirectory()).path;
      print("dir$dir");
      return new File('$dir/counter.txt');
    }

    Future<int> _readCounter() async {
      try {
        File file = await _getLocalFile();
        // 读取点击次数（以字符串）
        String contents = await file.readAsString();
        return int.parse(contents);
      } on FileSystemException {
        return 0;
      }
    }

    useEffect(() {
      _readCounter().then((int value) {
        counter.setState(value);
      });
    }, []);

    Future<Null> _incrementCounter() async {
      counter.setState(++counter.state);
      // 将点击次数以字符串类型写到文件中
      final filer = await _getLocalFile();
      print("filer$filer");
      await filer.writeAsString('${counter.state}');
    }

    // TODO: implement build
    return CommonScaffold(
      title: "文件操作",
      body: Column(
        children: <Widget>[
          Text("点击了${counter.state}"),
          FlatButton(onPressed: _incrementCounter, child: Text("add"))
        ],
      ),
    );
  }
}

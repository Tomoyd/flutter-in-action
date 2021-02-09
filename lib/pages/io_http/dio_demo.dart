import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class DioDemo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _loadState = useState<bool>(false);

    loadData() async {
      Dio dio = new Dio();
      Response res =
          await dio.get("https://api.github.com/orgs/flutterchina/repos");
      print(res.data);
      _loadState.setState(true);
    }

    useEffect(() {
      loadData();
    }, []);
    // TODO: implement build
    return CommonScaffold(
      title: "CommonScaffold",
      body: _loadState.state ? Text("加载完毕") : CircularProgressIndicator(),
    );
  }
}

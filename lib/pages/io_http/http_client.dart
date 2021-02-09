import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class HttpClientWidget extends HookWidget {
  HttpClientWidget({Key key});
  @override
  Widget build(BuildContext context) {
    final content = useState<String>('');

    getData({Map<String, dynamic> params, String host}) async {
      HttpClient httpClient = new HttpClient();
      content.setState("加载中");
      try {
        Uri uri = Uri(scheme: "https", host: host, queryParameters: params);

        HttpClientRequest request = await httpClient.getUrl(uri);
        request.headers.add("user-agent",
            "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
        HttpClientResponse response = await request.close();
        String text = await response.transform(utf8.decoder).join();
        httpClient.close();

        content.setState(text);
      } catch (e) {
        content.setState("错误");
      }
    }

    useEffect(() {
      getData(host: "www.baidu.com");
    }, []);
    // TODO: implement build
    return CommonScaffold(
      title: "http-client",
      body: Text("result>>${content.state}"),
    );
  }
}

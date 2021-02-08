import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/pages/hook/test_hooks2.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class CustomHookText extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final text = useState<int>(1);
    // final text2 = useState<int>(3);
    useEffect(() {
      print("effec111t");
    }, []);
    return CommonScaffold(
        title: "test hooks",
        body: Column(children: [
          FlatButton(
              onPressed: () {
                text.setState(++text.state);
              },
              child: Text("${text.state}")),
          TestHook2()
        ]));
  }
}

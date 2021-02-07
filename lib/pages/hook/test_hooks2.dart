import 'package:myapp/hooks/hooks.dart';

import 'package:flutter/material.dart';

class TestHook2 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final text = useState<int>(6);

    return FlatButton(
        onPressed: () {
          text.setState(++text.state);
        },
        child: Text("${text.state}"));
  }
}

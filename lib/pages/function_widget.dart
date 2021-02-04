import 'package:flutter/material.dart';

class WillPopScopeTest extends StatefulWidget {
  WillPopScopeTest({Key key}) : super(key: key);

  @override
  _WillPopScopeTestState createState() => _WillPopScopeTestState();
}

class _WillPopScopeTestState extends State<WillPopScopeTest> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Center(
          child: RaisedButton(
            onPressed: () {},
            child: Text("pop"),
          ),
        ),
        onWillPop: () async {
          print("不允许跳转");
          return true;
        });
  }
}

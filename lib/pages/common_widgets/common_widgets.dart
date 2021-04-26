import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class CommonWidgets extends StatefulWidget {
  CommonWidgets({Key key}) : super(key: key);

  @override
  _CommonWidgetsState createState() => _CommonWidgetsState();
}

class _CommonWidgetsState extends State<CommonWidgets> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "常用的Widgets",
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              child:Text("123")
            )
          ]
      ),),
    );
  }
}
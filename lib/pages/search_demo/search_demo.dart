import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class SearchDemo extends StatefulWidget {
  SearchDemo({Key key}) : super(key: key);

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  @override
  Widget build(BuildContext context) {
    GlobalKey _buttonKey = GlobalKey();
    return CommonScaffold(
        title: "Search Demo",
        body: Column(
          children: [
            RaisedButton(
              key: _buttonKey,
              onPressed: () async {
                print("height:>>${_buttonKey.currentContext.size.height}");
                // await showTopModalSheet(
                //     context: context,
                //     child: Container(
                //       color: Colors.white,
                //       height: 300,
                //       child: Text("999"),
                //     ));
              },
              child: Text("弹出"),
            ),
          ],
        ));
  }
}

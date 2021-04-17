import 'package:flutter/material.dart';
import 'package:myapp/components/filter_window/filter_window.dart';
import 'package:myapp/components/filter_window/show_top_sheet.dart';
import 'package:myapp/widgets/common_scaffold.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:top_modal_sheet/top_modal_sheet.dart';

class SearchDemo extends StatefulWidget {
  SearchDemo({Key key}) : super(key: key);

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  GlobalKey _buttonKey = GlobalKey();
  List<Map<String, dynamic>> _filters = [
    {
      "name": 1,
    },
    {"name": 2},
    {"name": 3},
    {"name": 4},
  ];

  Widget _filterBuilder(data, index) {
    return Container(
      child: Text(
        "$index",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "Search Demo",
        body: Column(
          children: [
            FilterWindow(
                filters: _filters,
                filterItemBuilder: _filterBuilder,
                onPick: (context, data) {
                  showTopSheet(context,
                      begin: SheetBegin.APP_BAR,
                      content: Container(child: Text("$data")));
                }),
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

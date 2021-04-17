import 'package:flutter/material.dart';
import 'package:myapp/components/filter_sheet/filter_sheet.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "filterPage",
      body: FilterSheet(
          trigger: GestureDetector(
              child: Text("trigger"),
              onTap: () {
                print("12334");
              }),
          child: Text("123")),
    );
  }
}

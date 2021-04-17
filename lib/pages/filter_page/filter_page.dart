import 'package:flutter/material.dart';
import 'package:myapp/components/filter_sheet/filter_sheet.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Widget _child = null;
  String _key = "0";
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "filterPage",
      body: FilterSheet(
          result: Text("888"),
          trigger: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ["1", "2", "3"]
                  .map((e) => Expanded(
                          child: InkWell(
                        onTap: () {
                          print("123");
                          setState(() {
                            _child =
                                Container(color: Colors.white, child: Text(e));
                          });
                        },
                        child: Container(
                            alignment: Alignment.center, child: Text(e)),
                      )))
                  .toList()),
          child: _child),
    );
  }
}

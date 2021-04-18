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
          result: GestureDetector(
            child: Text("888"),
            onTap: () {
              print("666");
            },
          ),
          listData: ["1", "22", "333"],
          listItem: (item, index) {
            return Text(item);
          },
          children: [
            Builder(builder: (context) {
              return GestureDetector(
                  child: Text("123"),
                  onTap: () {
                    print(FilterSheet.of(context).currentKey);
                    FilterSheet.of(context).setState(() {
                      FilterSheet.of(context).currentKey = -1;
                    });
                  });
            }),
            Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text("1"), Text("2"), Text("3")]),
            Container(child: Text("6666"))
          ]),
    );
  }
}

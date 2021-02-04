import 'package:flutter/material.dart';

class FullBottomSheet extends StatefulWidget {
  FullBottomSheet({Key key}) : super(key: key);

  @override
  _FullBottomSheetState createState() => _FullBottomSheetState();
}

class _FullBottomSheetState extends State<FullBottomSheet> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Full"),
      ),
      body: Column(
        children: <Widget>[
          Builder(builder: (BuildContext context) {
            return RaisedButton(
                onPressed: () {
                  _showFullScreenBottomSheet(context);

                  print("result");
                },
                child: Text("全屏Bottom Sheet"));
          })
        ],
      ),
    );
  }

  PersistentBottomSheetController<int> _showFullScreenBottomSheet(
      BuildContext context) {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }
}

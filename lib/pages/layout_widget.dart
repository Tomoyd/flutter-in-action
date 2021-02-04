import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  LayoutDemo({Key key}) : super(key: key);

  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      print(_tabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("返回"),
        actions: <Widget>[Text("取消")],
        title: Text("name"),
        bottom: TabBar(
            controller: _tabController,
            tabs: ["1", "2", "3"].map((e) => Text(e)).toList()),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              color: Color(0xFF518789),
              height: 120,
              width: 120,
              child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.email),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.email),
                ),
              ])),
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.pink, Colors.red])),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              child: Text("Logo"),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast),
            ],
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget rightAction;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CommonScaffold(
      {Key key, this.body, this.title, this.rightAction, this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text(title),
      //   actions: rightAction == null ? rightAction : <Widget>[rightAction],
      // ),
      body: SafeArea(child: body),
    );
  }
}

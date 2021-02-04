import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  final String tipMsg;
  const TipPage({Key key, this.tipMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: () => Navigator.pop(context, "接到信息：$tipMsg"),
          child: Text(tipMsg)),
    );
  }
}

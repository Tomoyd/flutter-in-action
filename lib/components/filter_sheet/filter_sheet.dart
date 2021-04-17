import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  final Widget trigger;
  final Widget child;
  final Widget result;
  FilterSheet({Key key, this.child, this.result, this.trigger})
      : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final _triggerKey = GlobalKey();
  double _height = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    // TODO: implement initState

    super.initState();
  }

  _afterLayout(_t) {
    setState(() {
      _height = _triggerKey.currentContext.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                alignment: Alignment.topLeft,
                color: Colors.black12,
                margin: EdgeInsets.only(top: _height),
                child: widget.result);
          }),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topLeft,
              color: Colors.yellow,
              child: widget.trigger,
              key: _triggerKey,
            ),
            widget.child == null
                ? Container()
                : Expanded(
                    child: Container(
                        alignment: Alignment.topLeft,
                        color: Colors.black38,
                        child: widget.child))
          ]),
        ],
      ),
    );
  }
}

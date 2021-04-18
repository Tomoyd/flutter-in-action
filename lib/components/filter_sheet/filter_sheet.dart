import 'package:flutter/material.dart';
import 'package:myapp/components/filter_sheet/animated.dart';

class FilterSheet<T> extends StatefulWidget {
  final Widget trigger;
  final List<Widget> children;
  final Widget result;
  final List<T> listData;
  final ListItem<T> listItem;
  FilterSheet(
      {Key key,
      this.children,
      this.result,
      this.trigger,
      this.listData,
      this.listItem})
      : super(key: key);
  static _FilterSheetState of(
    BuildContext context,
  ) =>
      context.findAncestorStateOfType<_FilterSheetState>();

  static close(context) {
    FilterSheet.of(context).setState(() {
      FilterSheet.of(context).currentKey = -1;
    });
  }

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  GlobalKey _triggerKey = GlobalKey();
  double _height = 0;
  int currentKey = -1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    // TODO: implement initState
    super.initState();
  }

  List<Widget> _triggerItem() {
    return widget.listData
        .asMap()
        .map((key, e) => MapEntry(
            key,
            Expanded(
                child: GestureDetector(
              child: widget.listItem(e, key),
              onTap: () {
                if (currentKey == key) {
                  setState(() {
                    currentKey = -1;
                  });
                } else {
                  setState(() {
                    currentKey = key;
                  });
                }
              },
            ))))
        .values
        .toList();
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
              child: Row(children: _triggerItem()),
              key: _triggerKey,
            ),
            currentKey == -1
                ? Container()
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentKey = -1;
                          });
                        },
                        child: Container(
                            alignment: Alignment.topLeft,
                            color: Colors.black38,
                            child: GestureDetector(
                                onTap: () {},
                                child: AnimatedExpend(
                                    child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: widget.children[currentKey],
                                ))))))
          ]),
        ],
      ),
    );
  }
}

typedef ListItem<T> = Widget Function(T data, int index);

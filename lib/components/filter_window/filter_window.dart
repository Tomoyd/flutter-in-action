import 'package:flutter/material.dart';
import 'package:myapp/components/filter_window/show_top_sheet.dart';

class FilterWindow<T> extends StatefulWidget {
  FilterWindow(
      {Key key,
      this.child,
      @required this.filters,
      @required this.filterItemBuilder})
      : super(key: key);
  final Widget child;
  final List<T> filters;
  final FilterItemBuilder<T> filterItemBuilder;
  static _FilterWindowState of(
    BuildContext context,
  ) =>
      context.findAncestorStateOfType<_FilterWindowState>();

  @override
  _FilterWindowState createState() => _FilterWindowState();
}

class _FilterWindowState extends State<FilterWindow> {
  GlobalKey containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.filters.asMap().keys.map((i) {
            return Expanded(
                child: GestureDetector(
                    onTap: () {
                      showTopSheet(containerKey.currentContext,
                          content: Container(
                            child: Text("12345"),
                          ));
                    },
                    child: widget.filterItemBuilder(widget.filters[i], i)));
          }).toList()),
    );
  }
}



typedef FilterItemBuilder<T> = Widget Function(T data, int index);

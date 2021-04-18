import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';

class FilterWindow<T> extends StatefulWidget {
  FilterWindow(
      {Key key,
      this.child,
      @required this.filters,
      @required this.onPick,
      @required this.filterItemBuilder})
      : super(key: key);
  final Widget child;
  final List<T> filters;
  final FilterItemBuilder<T> filterItemBuilder;
  final PickFunction<T> onPick;

  static _FilterWindowState of(
    BuildContext context,
  ) =>
      context.findAncestorStateOfType<_FilterWindowState>();

  @override
  _FilterWindowState createState() => _FilterWindowState();
}

class _FilterWindowState<T> extends State<FilterWindow> {
  GlobalKey containerKey = GlobalKey();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.filters.asMap().keys.map((i) {
            T item = widget.filters[i];
            return Expanded(
                child: GestureDetector(
                    onTap: () {
                      widget.onPick(containerKey.currentContext, item);
                    },
                    child: widget.filterItemBuilder(item, i)));
          }).toList()),
    );
  }
}

typedef PickFunction<T> = void Function(BuildContext context, T data);

typedef FilterItemBuilder<T> = Widget Function(T data, int index);

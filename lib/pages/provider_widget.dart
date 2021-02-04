import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child}) : super(key: key);
  final Widget child;
  final T data;

  static T of<T>(BuildContext context, {bool hasDependence = true}) {
    return hasDependence
        ? context
            .dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
            .data
        : (context
                .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
                ?.widget as InheritedProvider<T>)
            .data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child);
  }
}

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List<VoidCallback> listeners = [];
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
    listeners.remove(listener);
  }

  void notifyListeners() {
    listeners.forEach((listener) => listener());
  }
}

class GoodsConsumer<T> extends StatelessWidget {
  final Widget child;
  final Widget Function(BuildContext context, T modal) builder;
  const GoodsConsumer({Key key, @required this.builder, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}

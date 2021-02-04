import 'package:flutter/material.dart';
import 'package:myapp/widgets/common_scaffold.dart';
import 'package:myapp/widgets/show_custom_dialog.dart';

class DialogDemo extends StatefulWidget {
  DialogDemo({Key key}) : super(key: key);

  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  bool _deleteChildren = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print("_deleteChildren$_deleteChildren");
    return CommonScaffold(
      scaffoldKey: _scaffoldKey,
      title: "Dialog Demo ${_deleteChildren}",
      body: Column(children: [
        RaisedButton(
          onPressed: () async {
            /// 不能是延迟加载的组件 如ListView等
            bool result = await showAlertDialog();
            print(result);
          },
          child: Text("alert dialog"),
        ),
        RaisedButton(
          onPressed: () async {
            /// 不能是延迟加载的组件 如ListView等
            var result = await showSimpleDialog();

            print(result);
          },
          child: Text("Simple Dialog"),
        ),
        RaisedButton(
          onPressed: () async {
            /// 不能是延迟加载的组件 如ListView等
            var result = await showPlainDialog();

            print(result);
          },
          child: Text("plain Dialog"),
        ),
        RaisedButton(
          onPressed: () async {
            /// 不能是延迟加载的组件 如ListView等
            var result = await showInnerCustomDialog();

            print(result);
          },
          child: Text("Inner Custom Dialog"),
        ),
        RaisedButton(
          onPressed: () async {
            /// 不能是延迟加载的组件 如ListView等
            var result = await showOuterCustomDialog();

            print(result);
          },
          child: Text("Outer Custom Dialog"),
        ),
        RaisedButton(
            onPressed: () async {
              var result = await showStateDialog();

              print("result$result,_deleteChildren:$_deleteChildren");
            },
            child: Text("状态管理")),
        RaisedButton(
            onPressed: () async {
              var result = await _showModalBottomSheet();

              print("result$result");
            },
            child: Text("Bottom Sheet")),
        Builder(builder: (BuildContext context) {
          return RaisedButton(
              onPressed: () {
                _showFullScreenBottomSheet(context);

                print("result");
              },
              child: Text("全屏Bottom Sheet"));
        })
      ]),
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

  Future<bool> showAlertDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("我是一条alertDialog弹框信息"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide()),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(), //关闭对话框
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  // ... 执行删除操作
                  Navigator.of(context).pop(true); //关闭对话框
                },
              ),
            ],
          );
        });
  }

  Future<int> showSimpleDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Selected"),
            children: <Widget>[
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                  child: Text("中")),
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 2);
                  },
                  child: Text("英")),
            ],
          );
        });
  }

  Future<int> showPlainDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return FlatButton(
                      onPressed: () {
                        Navigator.pop(context, i);
                      },
                      child: Text("$i"));
                }),
          );
        });
  }

  Future<dynamic> showInnerCustomDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270),
              child: FlatButton(
                  child: Text("Custom Dialog"),
                  // leading: Text("leading"),
                  onPressed: () {
                    Navigator.pop(context, "custom");
                  }),
            ),
          );
        });
  }

  Future<bool> showOuterCustomDialog() {
    return showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Selected"),
          children: <Widget>[
            SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("中")),
            SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("英")),
          ],
        );
      },
    );
  }

  Future<bool> showStateDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          print("999");
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  // 将选中状态返回
                  Navigator.of(context).pop(_deleteChildren);
                },
              ),
            ],
            content: Row(children: [
              Text("删除子文件夹$_deleteChildren"),
              StatefulBuilder(builder: (context, _setState) {
                return Checkbox(
                    value: _deleteChildren,
                    onChanged: (value) {
                      _setState(() {
                        _deleteChildren = value;
                      });
                    });
              })
            ]),
          );
        });
  }

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }
}

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  ThemePage({Key key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            primaryColor: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          appBar: AppBar(title: Text("theme data")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.palette),
              Icon(Icons.email),
              Icon(Icons.favorite),
              Text("主题颜色"),
              Theme(
                data: _themeData.copyWith(
                    iconTheme:
                        _themeData.iconTheme.copyWith(color: Colors.black)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色固定黑色")
                    ]),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => //切换主题
                  setState(() => _themeColor =
                      _themeColor == Colors.teal ? Colors.blue : Colors.teal),
              child: Icon(Icons.palette)),
        ));
  }
}

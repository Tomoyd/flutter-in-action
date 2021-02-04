import 'package:flutter/material.dart';
import 'package:myapp/pages/card_exp.dart';
import 'package:myapp/pages/dialog.dart';
import 'package:myapp/pages/event_and_notice/event_bus.dart';
import 'package:myapp/pages/event_and_notice/gesture.dart';
import 'package:myapp/pages/event_and_notice/listener.dart';
import 'package:myapp/pages/event_and_notice/notice_widget.dart';
import 'package:myapp/pages/full_bottom.dart';
import 'package:myapp/pages/function_widget.dart';
import 'package:myapp/pages/future_widget.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/inherited_widget_test.dart';
import 'package:myapp/pages/layout_widget.dart';
import 'package:myapp/pages/theme_page.dart';
import 'package:myapp/pages/tip.dart';
part "page_map.dart";

class Router {
  static const String HOME = "/";

  static const String TIP = "/tip";

  static const String DEMO = "/demo";

  static const String WILL_POP = "/willPop";

  static const String INHERITED_WIDGET = "/inherited";

  static const String SHOP_CART = "/shop_cart";

  static const String THEME_PAGE = "/theme";

  static const String FUTURE_PAGE = "/future";

  static const String DIALOG_DEMO = "/dialog";
  static const String FULL_BOTTOM_SHEET = "/full";

  static const String ORG_POINTER_EVENT = "/pointer";

  static const String GESTURE_DEMO = "/gesture";
  static const String EVENT_BUS = "/eventBus";

  static const String NOTICE_DEMO = "/notice";

  static MaterialPageRoute routeGenerator(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) {
      String name = setting.name;
      Map routeParam = setting.arguments as Map;

      if (_pageMap[name] == null) {
        return SafeArea(child: Text("not fount"));
      }
      return _pageMap[name](routeParam);
    });
  }
}

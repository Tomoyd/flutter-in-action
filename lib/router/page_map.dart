part of "router.dart";

Map<String, Widget Function(Map)> _pageMap = {
  Router.HOME: (routeParam) => MyHomePage(
        title: "home",
      ),
  Router.TIP: (routeParam) => TipPage(
        tipMsg: routeParam["tipMsg"],
      ),
  Router.DEMO: (routeParam) => LayoutDemo(),
  Router.WILL_POP: (routeParam) => WillPopScopeTest(),
  Router.INHERITED_WIDGET: (routeParam) => InheritedWidgetTest(),
  Router.SHOP_CART: (routeParam) => ShopCarPage(),
  Router.THEME_PAGE: (routeParam) => ThemePage(),
  Router.FUTURE_PAGE: (routeParam) => FutureBuilderPage(),
  Router.DIALOG_DEMO: (routeParam) => DialogDemo(),
  Router.FULL_BOTTOM_SHEET: (routeParam) => FullBottomSheet(),
  Router.ORG_POINTER_EVENT: (routeParam) => ListenerWidgetDemo(),
  Router.GESTURE_DEMO: (routeParam) => GestureDemo(),
  Router.EVENT_BUS: (routeParam) => EventBusDemo(),
  Router.NOTICE_DEMO: (routeParam) => NotificationDemo()
};

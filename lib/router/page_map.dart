part of "router.dart";

Map<String, Widget Function(Map)> _pageMap = {
  MyRouter.HOME: (routeParam) => MyHomePage(
        title: "home",
      ),
  MyRouter.TIP: (routeParam) => TipPage(
        tipMsg: routeParam["tipMsg"],
      ),
  MyRouter.Filter_DEMO: (routeParam) => FilterPage(),
  MyRouter.DEMO: (routeParam) => LayoutDemo(),
  MyRouter.WILL_POP: (routeParam) => WillPopScopeTest(),
  MyRouter.INHERITED_WIDGET: (routeParam) => InheritedWidgetTest(),
  MyRouter.SHOP_CART: (routeParam) => ShopCarPage(),
  MyRouter.THEME_PAGE: (routeParam) => ThemePage(),
  MyRouter.FUTURE_PAGE: (routeParam) => FutureBuilderPage(),
  MyRouter.DIALOG_DEMO: (routeParam) => DialogDemo(),
  MyRouter.FULL_BOTTOM_SHEET: (routeParam) => FullBottomSheet(),
  MyRouter.ORG_POINTER_EVENT: (routeParam) => ListenerWidgetDemo(),
  MyRouter.GESTURE_DEMO: (routeParam) => GestureDemo(),
  MyRouter.EVENT_BUS: (routeParam) => EventBusDemo(),
  MyRouter.NOTICE_DEMO: (routeParam) => NotificationDemo(),
  MyRouter.ANIMATION_DEMO: (routeParam) => AnimationDemo(),
  MyRouter.HOOK_TEST: (routeParam) => CustomHookText(),
  MyRouter.CUSTOM_WIDGET: (routeParam) => CustomWidget(),
  MyRouter.IO_HTTP_DEMO: (routeParam) => IOHttpDemo(),
  MyRouter.SEARCH_DEMO: (routeParam) => SearchDemo()
};

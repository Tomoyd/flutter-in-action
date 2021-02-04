import 'package:flutter/material.dart';
import 'package:myapp/pages/tip.dart';
import 'package:myapp/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.routeGenerator,
      navigatorObservers: [MyNavigatorObserver()],
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (context) => SafeArea(child: Text("unKnown"))),
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFFFF5125,
          <int, Color>{
            50: Color(0xFFFCE4EC),
            100: Color(0xFFF8BBD0),
            200: Color(0xFFF48FB1),
            300: Color(0xFFF06292),
            400: Color(0xFFEC407A),
            500: Color(0xFFFF5125),
            600: Color(0xFFD81B60),
            700: Color(0xFFC2185B),
            800: Color(0xFFAD1457),
            900: Color(0xFF880E4F),
          },
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  NavigatorState get navigator => _navigator;
  NavigatorState _navigator;

  /// The [Navigator] pushed `route`.
  ///
  /// The route immediately below that one, and thus the previously active
  /// route, is `previousRoute`.
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("did push");
  }

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {}

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  ///
  /// If multiple routes are being removed, then the route below the
  /// bottommost route being removed, if any, is `previousRoute`, and this
  /// method will be called once for each removed route, from the topmost route
  /// to the bottommost route.
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {}

  /// The [Navigator]'s routes are being moved by a user gesture.
  ///
  /// For example, this is called when an iOS back gesture starts, and is used
  /// to disabled hero animations during such interactions.
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic> previousRoute) {}

  /// User gesture is no longer controlling the [Navigator].
  ///
  /// Paired with an earlier call to [didStartUserGesture].
  void didStopUserGesture() {}
}

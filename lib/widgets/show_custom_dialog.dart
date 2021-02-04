import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T> showCustomDialog<T>(
    {@required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder}) {
  final ThemeData themeData = Theme.of(context, shadowThemeOnly: true);

  return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 100),
      transitionBuilder: _transitionBuilder,
      barrierColor: Colors.black87,
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(child: Builder(
          builder: (context) {
            return themeData != null
                ? Theme(data: themeData, child: pageChild)
                : pageChild;
          },
        ));
      });
}

Widget _transitionBuilder(BuildContext context, Animation<double> ani0,
    Animation<double> an1, Widget child) {
  return ScaleTransition(
    scale: CurvedAnimation(parent: ani0, curve: Curves.easeOut),
    child: child,
  );
}

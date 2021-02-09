import 'package:flutter/material.dart';
import 'package:myapp/hooks/hooks.dart';
import 'package:myapp/pages/custom_widget/custom_paint_demo.dart';
import 'package:myapp/widgets/common_scaffold.dart';

class CustomWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final turner = useState<double>(0);
    return CommonScaffold(
        title: "Custom widget",
        body: Column(children: [
          TurnBox(
              turns: turner.state,
              child: FlatButton(
                  onPressed: () {
                    turner.setState(turner.state + .2);
                  },
                  child: Text("旋转"))),
          CustomPainterDemo(),
        ]));
  }
}

class TurnBox extends StatefulWidget {
  final double turns;
  final Widget child;
  final int duration;
  TurnBox({Key key, this.turns, this.child, this.duration = 200})
      : super(key: key);

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      lowerBound: -double.infinity,
      upperBound: double.infinity,
      vsync: this,
    );
    controller.value = widget.turns;
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

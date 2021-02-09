import 'package:flutter/material.dart';

class CustomPainterDemo extends StatelessWidget {
  const CustomPainterDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width / 15;
    double height = size.height / 10;

    print("size:width>$width,height>$height");

    var painter = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb115);

    canvas.drawRect(Offset.zero & size, painter);

    painter.color = Color(0xFF000000);

    canvas.drawCircle(Offset(width, height), 10, painter);

    painter.color = Color(0xFFffffff);
    canvas.drawCircle(Offset(size.width / 1.5, size.height / 2), 10, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

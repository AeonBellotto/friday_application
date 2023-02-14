import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Roboto',
    textTheme: textTheme(),
  );
}

int baseAlpha = 255;
int baseRed = 255;
int baseGreen = 255;
int baseBlue = 255;

Color baseColor = Color.fromARGB(baseAlpha, baseRed, baseGreen, baseBlue);

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(color: baseColor, fontSize: 60),
    headline2: TextStyle(color: baseColor, fontSize: 40),
    headline3: TextStyle(color: baseColor.withOpacity(0.7), fontSize: 20),
    headline4: TextStyle(color: baseColor, fontSize: 16),
    headline5: TextStyle(color: baseColor, fontSize: 14),
    headline6: TextStyle(color: baseColor, fontSize: 12),
    bodyText1: TextStyle(color: baseColor, fontSize: 12),
    bodyText2: TextStyle(
        color: baseColor, fontSize: 10, fontWeight: FontWeight.normal),
  );
}

class NewsBanner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 50, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class NewsBannerBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = baseColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width - 50, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

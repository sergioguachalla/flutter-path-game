import 'package:flutter/material.dart';
class SquarePointsPainter extends CustomPainter {
  final double x;
  final double y;
  final double sideLength;

  SquarePointsPainter({required this.x, required this.y, this.sideLength = 100.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0;

    // Puntos para formar un cuadrado
    final Offset topLeft = Offset(x, y);
    final Offset topRight = Offset(x + sideLength, y);
    final Offset bottomLeft = Offset(x, y + sideLength);
    final Offset bottomRight = Offset(x + sideLength, y + sideLength);

    // Dibujar los puntos
    canvas.drawCircle(topLeft, 5.0, paint);
    canvas.drawCircle(topRight, 5.0, paint);
    canvas.drawCircle(bottomLeft, 5.0, paint);
    canvas.drawCircle(bottomRight, 5.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Repintar siempre para poder mover la posición del cuadrado
  }
}

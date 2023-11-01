import 'dart:math';

import 'package:flutter/material.dart';

import '../models/star.dart';

class StarPainter extends CustomPainter {
  final List<Star> stars;
  final Path path;

  StarPainter({required this.stars, required this.path});

  @override
  void paint(Canvas canvas, Size size) {
    final starPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final pathPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (var star in stars) {
      _drawStar(canvas, star.position, star.radius, starPaint);
    }

    canvas.drawPath(path, pathPaint);

  }




  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    const numberOfPoints = 5;
    const double slice = (2 * pi) / numberOfPoints;
    final Path starPath = Path();
    final double halfRadius = radius * 0.5;

    for (int i = 0; i < numberOfPoints; i++) {
      final double angle = slice * i;
      final double innerAngle = angle + slice / 2;

      final double outerX = center.dx + radius * cos(angle);
      final double outerY = center.dy + radius * sin(angle);
      final double innerX = center.dx + halfRadius * cos(innerAngle);
      final double innerY = center.dy + halfRadius * sin(innerAngle);

      if (i == 0) {
        starPath.moveTo(outerX, outerY);
      } else {
        starPath.lineTo(outerX, outerY);
      }
      starPath.lineTo(innerX, innerY);
    }
    starPath.close();
    canvas.drawPath(starPath, paint);
  }




}
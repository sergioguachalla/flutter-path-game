import 'package:flutter/material.dart';

class Star {
  final Offset position;
  bool isConnected;
  final double radius;

  Star({required this.position, this.isConnected = false, this.radius = 24.0});
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_game/painters/square_painter.dart';
import 'package:path_game/painters/star_painter.dart';

import '../models/star.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Star> stars = [];
  Path path = Path();

  @override
  Widget build(BuildContext context) {
    stars = generateStars();
    return Scaffold(
      body: Row(
        children: [
            CustomPaint(
              painter: StarPainter(stars: stars, path: path),

            ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }


  List<Star> generateStars(){
    final List<Star> stars = [];
    Random random = Random();

    for (var i = 0; i < 5; i++) {
      Offset pos = Offset(random.nextInt(500).toDouble(), random.nextInt(500).toDouble());
      stars.add(Star(position: pos));
    }
    return stars;
  }
}

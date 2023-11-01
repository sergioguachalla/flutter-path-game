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
    Size screenSize = MediaQuery.of(context).size;
    Offset center = Offset(screenSize.width / 2, screenSize.height / 2);
    stars = generateStarsAroundCenter(center, 5, 150.0);
    return Scaffold(
      body: Row(
        children: [
            CustomPaint(
              painter: StarPainter(stars: stars, path: path, center: center),

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


  List<Star> generateStarsAroundCenter(Offset center, int numberOfStars, double radiusFromCenter) {
    List<Star> stars = [];
    Random rand = Random();

    for (int i = 0; i < numberOfStars; i++) {
      double randomDX = (rand.nextDouble() * 4 - 1) * radiusFromCenter;
      double randomDY = (rand.nextDouble() * 3 - 1) * radiusFromCenter;

      double dx = center.dx + randomDX;
      double dy = center.dy + randomDY;

      stars.add(Star(position: Offset(dx, dy)));
    }

    return stars;
  }
}

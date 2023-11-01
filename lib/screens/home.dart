import 'dart:math';

import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size screenSize = MediaQuery.of(context).size;
    Offset center = Offset(screenSize.width / 2, screenSize.height / 2);
    if (stars.isEmpty) {
      stars = generateStarsAroundCenter(center, 5, 150.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Offset center = Offset(screenSize.width / 2, screenSize.height / 2);
    return Scaffold(
      body: Row(
        children: [
          GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            child: Container(
              width: screenSize.width,  // o un valor fijo como 300
              height: screenSize.height, // o un valor fijo como 300
              child: CustomPaint(
                painter: StarPainter(stars: stars, path: path, center: center),
              ),
            ),
          )
,

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Stack(
          children: [
            Container(
              height: 60,
              color: Colors.blue,
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      icon: Icon(Icons.undo_sharp),
                      onPressed: () {
                        setState(() {
                          print('undo');
                          path.reset();
                      });
                      },


                    ),

                  ),

                ],
              ),
            ),
          ],
        )
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

  void _onPanStart(DragStartDetails details) {
    setState(() {
      path.moveTo(details.localPosition.dx, details.localPosition.dy);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      path.lineTo(details.localPosition.dx, details.localPosition.dy);
    });
  }

}

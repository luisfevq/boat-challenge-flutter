import 'package:boat_app/app/boats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.boat}) : super(key: key);

  final Boat boat;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward(from: 0.0);
    _animationController.drive(
      CurveTween(curve: Curves.easeInOutBack),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.easeInOutBack,
        parent: _animationController,
        reverseCurve: Curves.easeInOutBack,
      ),
    );
    super.initState();
  }

  void onTapClose() {
    _animationController.reverse();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double initialPosition = size.width / 2 - (size.width / 2);
    double initialTop = size.height * .11;

    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double value = _animationController.value;
            double currentTop = 0 - initialTop * value + initialTop;
            return Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: currentTop,
                    left: value == 0 ? initialPosition : 120,
                    child: Container(
                      child: Transform.scale(
                        scale: 1.8 * animation.value,
                        child: Transform.rotate(
                          angle: Math.pi / 180 * (-90 * value),
                          child: Image.asset(
                            widget.boat.urlImage,
                            width: size.width,
                            height: value == 0
                                ? size.height * .6
                                : size.height * .4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * .4,
                    child: Container(
                      width: size.width,
                      height: size.height * .4,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.boat.title,
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => onTapClose(),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

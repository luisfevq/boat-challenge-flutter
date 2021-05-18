import 'package:boat_app/app/boats.dart';
import 'package:boat_app/app/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTap(Boat boat) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: DetailScreen(
              boat: boat,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width,
              child: Text(
                "Boats",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height - 110,
              child: PageView.builder(
                itemCount: boatsData.length,
                itemBuilder: (BuildContext context, int index) {
                  final boat = boatsData[index];
                  return boatWidget(
                    boat: boat,
                    size: size,
                    onTap: () => onTap(boat),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boatWidget({Boat boat, Size size, Function onTap}) {
    return Container(
      width: size.width * .8,
      height: size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            boat.urlImage,
            width: size.width * .35,
            height: size.height * .6,
          ),
          Text(
            boat.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "By ${boat.by}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "SPEC >",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4540A4),
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

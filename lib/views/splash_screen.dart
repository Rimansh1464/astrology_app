import 'package:astrology_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  initTime() async {
    await Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  @override
  void initState() {
    super.initState();
    initTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asserts/image/spalsh.png",
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Astroguide",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

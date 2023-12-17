import 'package:final_project_for_flutter_by_jarling/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashArt extends StatelessWidget {
  const SplashArt({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset('Assets/Opener Loading.json'),
          ),
          SizedBox(height: 20),
          // Adjust the height as needed
          Text(
            'JARLING STUDIO',
            style: TextStyle(
              fontFamily: 'Genshin',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      splashIconSize: 350,
      backgroundColor: Colors.white,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      nextScreen: LoginPage(),
    );
  }
}

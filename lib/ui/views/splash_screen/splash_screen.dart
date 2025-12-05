import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../authentication/signUp_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const SignUp(),
      duration: 15000,
      backgroundColor: Colors.white,
      splashIconSize: double.infinity,

      splash: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Center(
              child: Lottie.asset(
                'assets/animations/Doggo.json',
                fit: BoxFit.contain,   // <-- NIENTE TAGLI
                alignment: Alignment.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
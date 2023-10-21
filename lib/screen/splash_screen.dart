import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return EasySplashScreen(
      logo: Image.asset(
        'assets/Axenix2.gif',
      ),
      logoWidth: h/3,
      // gradientBackground: Gradient.lerp(c, b, t),
      showLoader: false,
      durationInSeconds: 3,
      navigator: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tour_guide/view/screens/runner_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, RunnerScreen.id);
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/roadTripperLogo.png'),
      ),
    );
  }
}

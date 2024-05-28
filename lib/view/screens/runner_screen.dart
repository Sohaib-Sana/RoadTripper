import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/view/screens/authentication_screen.dart';
import 'package:tour_guide/view/screens/dashboard_screen.dart';

class RunnerScreen extends StatefulWidget {
  static const String id = '/runner-screen';
  const RunnerScreen({super.key});

  @override
  State<RunnerScreen> createState() => _RunnerScreenState();
}

class _RunnerScreenState extends State<RunnerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashboardScreen();
            }
            return const AuthScreen();
          },
        ),
      ),
    );
  }
}

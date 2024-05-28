import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/view/screens/dashboard_screen.dart';

void authenticateUser(
  BuildContext context, {
  required String email,
  required String password,
  required bool isLoginPage,
  String? displayName,
}) async {
  if (!isLoginPage) {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(displayName);
      if (userCredential.user != null) {
        if (!context.mounted) return;
        Navigator.popAndPushNamed(context, DashboardScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        if (!context.mounted) return;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    "Account Already Exists",
                    style: TextStyle(color: Colors.black),
                  ),
                  content: const Text("Account with this email Already Exists"),
                  actions: [
                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ));
        print("Email already used.");
      }
    }
  } else {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        if (!context.mounted) return;
        Navigator.popAndPushNamed(context, DashboardScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      String? title;
      String? content;
      if (e.code == "invalid-email") {
        title = "Invalid Email";
        content = "No Account with this email exists";
        print('$e');
      } else if (e.code == "invalid-credential") {
        title = "Invalid Credential";
        content = "You have entered wrong credentials";
      }
      if (!context.mounted) return;
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  title!,
                  style: const TextStyle(color: Colors.black),
                ),
                content: Text(content!),
                actions: [
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }
  }
  return null;
}

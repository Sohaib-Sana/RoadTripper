import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/helper/authentication_handle.dart';
import 'package:tour_guide/view/widgets/auth_button.dart';
import 'package:tour_guide/view/widgets/auth_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String id = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoginPage = false;

  void _submitForm(BuildContext context, String email, String password,
      String? displayName) {
    if (_formKey.currentState!.validate()) {
      authenticateUser(
        context,
        email: email,
        password: password,
        isLoginPage: isLoginPage,
        displayName: displayName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ROAD TRIPPERS",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(isLoginPage ? "Login" : 'Signup',
                              style: const TextStyle(fontSize: 20)),
                          kVerticalGaps,
                          if (!isLoginPage)
                            CustomAuthField(
                                hintText: "Username",
                                controller: _usernameController,
                                keyboardType: TextInputType.name,
                                validatorii: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name could not be empty';
                                  }
                                  return null;
                                }),
                          kVerticalGaps,
                          CustomAuthField(
                            validatorii: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email could not be empty';
                              }
                              return null;
                            },
                            hintText: "Email Address",
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          kVerticalGaps,
                          CustomAuthField(
                            validatorii: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password could not be empty';
                              }
                              return null;
                            },
                            hintText: "Password",
                            controller: _passwordController,
                            isPasswordField: true,
                            isObsecure: true,
                          ),
                          kVerticalGaps,
                          CustomAuthButton(
                              onPressed: () {
                                _submitForm(
                                    context,
                                    _emailController.text,
                                    _passwordController.text,
                                    _usernameController.text);
                              },
                              title: isLoginPage ? "Log in" : "Create Account"),
                          kVerticalGaps,
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                            indent: 8,
                            endIndent: 8,
                          ),
                          kVerticalGaps,
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Already have an account? ",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text:
                                            isLoginPage ? "Sign up" : "Sign in",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            setState(() {
                                              _formKey.currentState!.reset();
                                              isLoginPage = !isLoginPage;
                                            });
                                          },
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]))
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/roadTripperLogo.png',
                    width: deviceWidth(context) * 0.5,
                    height: deviceHeight(context) * 0.2,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

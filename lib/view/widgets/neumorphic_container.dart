import 'package:flutter/material.dart';

class CustomNeumorphicContainer extends StatelessWidget {
  final Widget child;
  const CustomNeumorphicContainer({super.key, required this.child, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              offset: const Offset(-2, -2),
              blurRadius: 2,
            ),
            const BoxShadow(
              color: Color.fromARGB(255, 201, 192, 192),
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ],
          color: Theme.of(context).canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ));
  }
}

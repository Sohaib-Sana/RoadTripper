import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key, required this.icon});
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.lightGreen,
      radius: 35,
      child: icon,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key, required this.title, required this.onPress});
  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.3),
      ),
      child: Text(title),
    );
  }
}

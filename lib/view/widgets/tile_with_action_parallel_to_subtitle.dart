import 'package:flutter/material.dart';

class CustomTileWithActionButtonParallelToSubtitle extends StatelessWidget {
  const CustomTileWithActionButtonParallelToSubtitle(
      {super.key,
      required this.title,
      this.subtitle,
      required this.actionText,
      this.callBack,
      this.actionColor});
  final String title;
  final String? subtitle;
  final String actionText;
  final Function()? callBack;
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(subtitle ?? ""),
            ),
            TextButton(
                onPressed: callBack,
                child: Text(
                  actionText,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: actionColor ?? Colors.black),
                )),
          ],
        ));
  }
}

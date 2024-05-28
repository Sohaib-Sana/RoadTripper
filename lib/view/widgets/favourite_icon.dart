import 'package:flutter/material.dart';

class FavouritIcon extends StatefulWidget {
  const FavouritIcon({super.key});

  @override
  State<FavouritIcon> createState() => _FavouritIconState();
}

class _FavouritIconState extends State<FavouritIcon> {
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isFilled = !isFilled;
          });
        },
        child: isFilled
            ? const Icon(
                Icons.favorite_outlined,
                size: 35,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                size: 35,
                color: Colors.black.withAlpha(170),
              ));
  }
}

import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';

class CustomTourCard extends StatelessWidget {
  const CustomTourCard(
      {super.key, required this.imagePath, required this.imageText});
  final String imagePath;
  final String imageText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Image.asset(
              imagePath,
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          kVerticalGaps,
          Text(
            imageText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}

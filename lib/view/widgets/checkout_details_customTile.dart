import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';

class CustomCheckoutListTile extends StatelessWidget {
  const CustomCheckoutListTile(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(subtitle)
          ],
        ),
        OutlinedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      title,
                      style: const TextStyle(color: Colors.black),
                    ),
                    content: const TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Ok"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          },
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: deviceWidth(context) * 0.12),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              side: const BorderSide(width: 2)),
          child: const Text("Enter"),
        )
      ],
    );
  }
}

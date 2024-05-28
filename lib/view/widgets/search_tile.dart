import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.icon, required this.title, this.subtitle});
  final IconData? icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: subtitle != null ? Text(subtitle!) : null,
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}

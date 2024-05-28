import 'package:flutter/material.dart';

class CustomCheckBoxWithTrailingTitleAndLeadingIcons extends StatefulWidget {
  const CustomCheckBoxWithTrailingTitleAndLeadingIcons(
      {super.key,
      required this.title,
      required this.icon,
      required this.isSelected});
  final String title;
  final IconData icon;
  final bool isSelected;

  @override
  State<CustomCheckBoxWithTrailingTitleAndLeadingIcons> createState() =>
      _CustomCheckBoxWithTrailingTitleAndLeadingIconsState();
}

class _CustomCheckBoxWithTrailingTitleAndLeadingIconsState
    extends State<CustomCheckBoxWithTrailingTitleAndLeadingIcons> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      secondary: Icon(widget.icon),
      value: widget.isSelected,
      onChanged: (_) {},
    );
  }
}

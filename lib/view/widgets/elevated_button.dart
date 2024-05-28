// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomElevatedContainer extends StatefulWidget {
  CustomElevatedContainer({
    super.key,
    required this.child,
    required this.onPress,
    this.isSelected = false,
  });
  final Widget child;
  VoidCallback onPress;
  bool isSelected;
  @override
  State<CustomElevatedContainer> createState() =>
      _CustomElevatedContainerState();
}

class _CustomElevatedContainerState extends State<CustomElevatedContainer> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.isSelected
          ? ElevatedButton.styleFrom(
              surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Colors.lightGreen,
              foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
              elevation: 5,
            )
          : ElevatedButton.styleFrom(
              surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
              elevation: 5,
            ),
      onPressed: widget.onPress,
      child: widget.child,
    );
  }
}

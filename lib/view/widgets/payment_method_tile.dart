// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomPaymentTypeTile extends StatefulWidget {
  CustomPaymentTypeTile({
    super.key,
    required this.title,
    this.icons,
    this.isSelected = false,
    required this.onChange,
  });
  final String title;
  bool isSelected;
  final List<IconData>? icons;
  VoidCallback onChange;
  @override
  State<CustomPaymentTypeTile> createState() => _CustomPaymentTypeTileState();
}

class _CustomPaymentTypeTileState extends State<CustomPaymentTypeTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(
                value: widget.isSelected,
                onChanged: (isChecked) {
                  widget.onChange();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              Text(widget.title),
            ],
          ),
        ),
        if (widget.icons != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(widget.icons![0], size: 32),
              ),
              if (widget.icons!.length > 1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(widget.icons![1], size: 32),
                ),
            ],
          ),
      ],
    );
  }
}

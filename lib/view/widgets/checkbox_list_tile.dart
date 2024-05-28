import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';

class CustomCheckBoxWithLeadingTitle extends StatefulWidget {
  const CustomCheckBoxWithLeadingTitle({super.key, required this.title});
  final String title;

  @override
  State<CustomCheckBoxWithLeadingTitle> createState() =>
      _CustomCheckBoxWithLeadingTitleState();
}

class _CustomCheckBoxWithLeadingTitleState
    extends State<CustomCheckBoxWithLeadingTitle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourScreenState>(
      builder: (context, state) {
        return CheckboxListTile(
          value: isSelected,
          dense: true,
          onChanged: (isChecked) {
            setState(() {
              isSelected = isChecked!;
              if (isChecked) {
                // Add the title to the selected cities list
                context
                    .read<TourCubit>()
                    .addItemToSelectedHotelList(widget.title);
              } else {
                // Remove the title from the selected cities list
                context
                    .read<TourCubit>()
                    .removeItemFromSelectedHotelList(widget.title);
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        );
      },
    );
  }
}

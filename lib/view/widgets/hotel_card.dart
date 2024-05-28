import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/widgets/filled_button.dart';

class CustomHotelCard extends StatelessWidget {
  const CustomHotelCard({
    super.key,
    this.horizontalPaddingInDouble = 0,
    this.verticalPaddingInDouble = 0,
    // required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.address,
    this.isShowButton = false,
    required this.stackChild,
  });
  final double horizontalPaddingInDouble;
  final double verticalPaddingInDouble;
  // final String imagePath;
  final String title;
  final Widget subtitle;
  final Widget address;
  final bool isShowButton;
  final Stack stackChild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPaddingInDouble,
                horizontal: horizontalPaddingInDouble),
            child: InkWell(
                onTap: () {
                  context.read<TourCubit>().changeCurrentTourPage(2);
                },
                child: stackChild),
          ),
          ListTile(
            title: Text(title),
            subtitle: subtitle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(alignment: Alignment.centerLeft, child: address),
          ),
          kVerticalGaps,
          if (isShowButton)
            CustomFilledButton(
              title: "BOOK ME",
              onPress: () {
                context.read<TourCubit>().changeCurrentTourPage(3);
              },
            ),
          // kGreyDivider,
          kDividerWithShadow
        ],
      ),
    );
  }
}

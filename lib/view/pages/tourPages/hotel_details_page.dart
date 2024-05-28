import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';

import 'package:tour_guide/view/widgets/checkbox_with_leading_icon.dart';
import 'package:tour_guide/view/widgets/favourite_icon.dart';
import 'package:tour_guide/view/widgets/hotel_card.dart';
import 'package:tour_guide/view/widgets/neumorphic_container.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHotelCard(
            stackChild: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.asset(
                    'assets/images/tourCar.jpeg',
                    width: double.infinity,
                    height: deviceHeight(context) * 0.375,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 15,
                    left: 15,
                    child: IconButton(
                      onPressed: () {
                        context.read<TourCubit>().changeCurrentTourPage(1);
                      },
                      icon: const Icon(Icons.arrow_back, size: 30),
                    )),
                const Positioned(top: 15, right: 15, child: FavouritIcon()),
                Positioned(
                  top: (deviceHeight(context) * 0.375) / 2,
                  left: 5,
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Positioned(
                  top: (deviceHeight(context) * 0.375) / 2,
                  right: 5,
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
            // imagePath: "assets/images/tourCar.jpeg",
            title: "Cordillera Resort",
            subtitle: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber[600],
                ),
                const Text("5.0"),
              ],
            ),
            address: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.call),
                kHorizontalGaps,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "N-15 Tranna, Mansehram Khyber Pakhtunkhwa",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(overflow: TextOverflow.visible),
                    ),
                    Text(
                      "0317 9090155",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          kVerticalGaps,
          Text(
            "Experience Hospitality In Its Finest Form",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          kVerticalGaps,
          kVerticalGaps,
          SizedBox(
            height: deviceHeight(context) * 0.25,
            width: deviceWidth(context) * 0.94,
            child: CustomNeumorphicContainer(
                width: deviceWidth(context) * 0.9,
                child: ListView(
                  children: [
                    resturantAttributesCardItems(
                      titleOfFirst: "Child Friendly",
                      titleOfSecond: "Parking",
                      iconOfFirst: Icons.child_care,
                      iconOfSecond: Icons.child_care,
                      isFirstSelected: true,
                      isSecondSelected: true,
                    ),
                    resturantAttributesCardItems(
                      titleOfFirst: "Airport Shuttle",
                      titleOfSecond: "Wifi",
                      iconOfFirst: Icons.connecting_airports,
                      iconOfSecond: Icons.wifi,
                      isSecondSelected: true,
                    ),
                    resturantAttributesCardItems(
                      titleOfFirst: "Breakfast",
                      titleOfSecond: "Restaurant",
                      iconOfFirst: Icons.breakfast_dining,
                      iconOfSecond: Icons.restaurant,
                      isFirstSelected: true,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

Row resturantAttributesCardItems({
  required String titleOfFirst,
  required String titleOfSecond,
  required IconData iconOfFirst,
  required IconData iconOfSecond,
  bool isFirstSelected = false,
  bool isSecondSelected = false,
}) {
  return Row(
    children: [
      Expanded(
          child: CustomCheckBoxWithTrailingTitleAndLeadingIcons(
        isSelected: isFirstSelected,
        title: titleOfFirst,
        icon: iconOfFirst,
      )),
      Expanded(
        child: CustomCheckBoxWithTrailingTitleAndLeadingIcons(
            isSelected: isSecondSelected,
            title: titleOfSecond,
            icon: iconOfSecond),
      ),
    ],
  );
}

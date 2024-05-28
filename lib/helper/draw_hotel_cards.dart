import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/view/widgets/favourite_icon.dart';
import 'package:tour_guide/view/widgets/hotel_card.dart';

Widget drawHotelCard(
  BuildContext context, {
  required String imagePath,
  required String title,
  required String subtitle,
  required String rating,
  required Widget address,
}) {
  return CustomHotelCard(
      horizontalPaddingInDouble: deviceWidth(context) * 0.12, //50,
      verticalPaddingInDouble: deviceHeight(context) * 0.014, //12,
      // imagePath: imagePath,
      title: title,
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subtitle),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: Text(rating)),
        ],
      ),
      address: address,
      isShowButton: true,
      stackChild: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(imagePath),
              width: double.infinity,
              height: deviceHeight(context) * 0.3,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              right: 10,
              child: IconButton(icon: const FavouritIcon(), onPressed: () {}))
        ],
      ));
}

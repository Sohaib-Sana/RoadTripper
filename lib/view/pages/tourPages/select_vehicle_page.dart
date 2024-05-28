import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/widgets/filled_button.dart';
import 'package:tour_guide/view/widgets/search_tile.dart';

class SelectVehiclePage extends StatelessWidget {
  const SelectVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.grey.withAlpha(50),
        toolbarHeight: deviceHeight(context) * 0.175,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<TourCubit>().changeCurrentTourPage(1);
              },
            ),
            kVerticalGaps,
            const CustomTextField(
                icon: Icons.bus_alert_outlined, title: "Select the Transport"),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: carsList.length,
          itemBuilder: (context, item) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: deviceWidth(context) * 0.08),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/${carsList[item]['imageName']}",
                        width: 180,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      kHorizontalGaps,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            carsList[item]['carName'],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(carsList[item]['carType']),
                          Text(carsList[item]['carRent']),
                        ],
                      )
                    ],
                  ),
                  kVerticalGaps,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Card(
                        color: Color.fromARGB(255, 220, 220, 220),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(children: [
                            Icon(Icons.auto_awesome_motion,
                                color: Colors.lightGreen),
                            kHorizontalGaps,
                            Text("Auto"),
                          ]),
                        ),
                      ),
                      Card(
                        color: const Color.fromARGB(255, 220, 220, 220),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            const Icon(Icons.chair_rounded,
                                color: Colors.lightGreen),
                            kHorizontalGaps,
                            Text(carsList[item]['seats']),
                          ]),
                        ),
                      ),
                      const Card(
                        color: Color.fromARGB(255, 220, 220, 220),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(children: [
                            Icon(Icons.ac_unit, color: Colors.lightGreen),
                            kHorizontalGaps,
                            Text("AC"),
                          ]),
                        ),
                      )
                    ],
                  ),
                  kVerticalGaps,
                  CustomFilledButton(
                      title: "BOOK ME",
                      onPress: () {
                        context.read<TourCubit>().changeCurrentTourPage(4);
                      }),
                  kDividerWithShadow,
                ],
              ),
            );
          }),
    );
  }
}

List carsList = [
  {
    'imageName': 'WagonR.jpeg',
    'carName': "Suzuki Wagon R",
    'carType': "VXL",
    'carRent': "Rs 3,499 / 1 day(s)",
    'seats': "4 Seats",
  },
  {
    'imageName': 'fortuner.jpeg',
    'carName': "Fortuner",
    'carType': "V8",
    'carRent': "Rs 9,999 / 1 day(s)",
    'seats': "7 Seats",
  }
];

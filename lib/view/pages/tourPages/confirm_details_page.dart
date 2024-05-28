import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/widgets/filled_button.dart';

class ConfirmBookingDetailsPage extends StatelessWidget {
  const ConfirmBookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              context.read<TourCubit>().changeCurrentTourPage(3);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Book your Trip."),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/Codrilla.jpeg',
                      width: deviceWidth(context) * 0.5,
                      height: deviceHeight(context) * 0.15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  kHorizontalGaps,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Hotel"),
                      Text(
                        "Cordillera Resort",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text("N-15, Tranna, Mansehra"),
                      const Text("khyber Pakhtoonkhwa"),
                      const Row(
                        children: [Icon(Icons.star), Text("5.0")],
                      )
                    ],
                  )
                ],
              ),
            ),
            kDividerWithShadow,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/WagonR.jpeg',
                    width: deviceWidth(context) * 0.375,
                    height: deviceHeight(context) * 0.12,
                    fit: BoxFit.fill,
                  ),
                  kHorizontalGaps,
                  kHorizontalGaps,
                  Column(
                    children: [
                      const Text("Transport"),
                      Text(
                        "Suzuki Wagon R",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text("VXL")
                    ],
                  )
                ],
              ),
            ),
            kGreyDivider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Trip",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text(
                      "Dates",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: const Text("Jan 3-8"),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Edit"),
                    ),
                  )
                ],
              ),
            ),
            kGreyDivider,
            ListTile(
              title: const Text("Price Details"),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Column(children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Rs 12,400 x 3 nights"), Text("Rs 37,200")],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Car Service Fee"), Text("Rs 10,500")],
                  ),
                  kDividerWithShadow,
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total"),
                        Text("Rs 47,700",
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    subtitle: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("50% of the amount"), Text("Rs 23,850")],
                    ),
                  )
                ]),
              ),
            ),
            CustomFilledButton(
                title: "Confim And Pay",
                onPress: () {
                  context.read<TourCubit>().changeCurrentTourPage(5);
                })
          ],
        ),
      ),
    );
  }
}

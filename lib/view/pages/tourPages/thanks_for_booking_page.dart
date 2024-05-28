import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';

class ThankyouForBookingPage extends StatelessWidget {
  const ThankyouForBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300,
        title: Text("Road Tripper",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                "Congratulations your trip is booked.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            kVerticalGaps,
            kVerticalGaps,
            kVerticalGaps,
            ElevatedButton(
                onPressed: () {
                  context.read<TourCubit>().changeCurrentTourPage(0);
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}

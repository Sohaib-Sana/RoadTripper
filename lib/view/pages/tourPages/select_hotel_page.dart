import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/helper/draw_hotel_cards.dart';
import 'package:tour_guide/helper/hotel_loader.dart'; // To load JSON file

class SelectHotelPage extends StatelessWidget {
  const SelectHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Hotel'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          context.read<TourCubit>().clearSelectedCitiesList();
          context.read<TourCubit>().changeCurrentTourPage(0);
          return;
        },
        child: BlocBuilder<TourCubit, TourScreenState>(
          builder: (context, state) {
            return FutureBuilder(
              future: loadCityBasedHotelsFromJson(
                  state.cities ?? []), // Load hotel data from JSON
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> hotels = snapshot.data!;
                  return ListView.builder(
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      var hotel = hotels[index];
                      return drawHotelCard(
                        context,
                        imagePath: hotel['image'],
                        title: hotel['name'],
                        subtitle: 'Luxury', // Assuming all are luxury hotels
                        rating: hotel['rating'].toString(),
                        address: Text(
                          hotel['address'],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("No data found"));
                }
              },
            );
          },
        ),
      ),
    );
  }
}

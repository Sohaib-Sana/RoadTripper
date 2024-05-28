import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/view/widgets/circle_avatar.dart';
import 'package:tour_guide/view/widgets/image_card.dart';
import 'package:tour_guide/view/widgets/search_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Where would you spend your holiday?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              kVerticalGaps,
              const CustomTextField(
                icon: Icons.search,
                title: "Where to?",
                subtitle: "Anywhere - Any week",
              ),
              kVerticalGaps,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCircleAvatar(icon: Icon(Icons.car_crash)),
                  CustomCircleAvatar(icon: Icon(Icons.bus_alert_rounded)),
                  CustomCircleAvatar(icon: Icon(Icons.motorcycle_rounded)),
                ],
              ),
              const ListTile(
                title: Text("Top Destinations"),
                trailing: Text("See all"),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomTourCard(
                        imagePath: 'assets/images/Mushkpuri.jpeg',
                        imageText: "So many activities!"),
                    kHorizontalGaps,
                    CustomTourCard(
                        imagePath: 'assets/images/Mushkpuri2.jpeg',
                        imageText: "So much fun!")
                  ],
                ),
              ),
              const ListTile(
                title: Text("Exclusive Hotels"),
                trailing: Text("See all"),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomTourCard(
                        imagePath: 'assets/images/Codrilla.jpeg',
                        imageText: "So many activities!"),
                    kHorizontalGaps,
                    CustomTourCard(
                        imagePath: 'assets/images/codrillera.jpeg',
                        imageText: "So much fun!")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

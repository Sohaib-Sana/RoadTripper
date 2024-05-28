import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<dynamic>> loadCityBasedHotelsFromJson(List<String> cities) async {
  List<dynamic> hotelLists = [];

  if (cities.isEmpty) {
    String data = await rootBundle.loadString('assets/luxury_hotels.json');
    Map<String, dynamic> jsonData = json.decode(data);
    return jsonData['luxury_hotels'];
  }

  String data = await rootBundle.loadString('assets/city_segmented_data.json');
  Map<String, dynamic> jsonData = json.decode(data);

  for (var city in cities) {
    Map<String, dynamic>? citySegment =
        jsonData['citySegmentedHotels'].firstWhere(
      (segment) => segment['city_name'] == city,
      orElse: () => null,
    );

    if (citySegment != null && citySegment.containsKey('hotel_list')) {
      List<dynamic> hotelList = citySegment['hotel_list'];
      hotelLists.addAll(hotelList);
    }
  }

  return hotelLists;
}

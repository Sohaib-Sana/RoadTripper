import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class TourCubit extends Cubit<TourScreenState> {
  TourCubit() : super(NavigationInitial());
  List<String> selectedCitiesList = [];

  void changeCurrentTourPage(int index) {
    emit(TourPageChanged(index: index, cities: state.cities));
  }

  void addItemToSelectedHotelList(String selectedCity) {
    selectedCitiesList.add(selectedCity);
    emit(UpdateSelectedCitiesState(cities: selectedCitiesList));
  }

  void removeItemFromSelectedHotelList(String unSelectCity) {
    selectedCitiesList.remove(unSelectCity);
    emit(UpdateSelectedCitiesState(cities: selectedCitiesList));
  }

  void clearSelectedCitiesList() {
    selectedCitiesList.clear();
    emit(UpdateSelectedCitiesState(cities: selectedCitiesList));
  }
}

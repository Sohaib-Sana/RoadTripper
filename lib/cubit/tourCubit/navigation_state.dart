part of 'navigation_cubit.dart';

@immutable
sealed class TourScreenState {
  final int index;
  final List<String>? cities;
  const TourScreenState({this.index = 0, this.cities});
}

final class NavigationInitial extends TourScreenState {}

final class TourPageChanged extends TourScreenState {
  const TourPageChanged({super.index, super.cities});
}

final class UpdateSelectedCitiesState extends TourScreenState {
  const UpdateSelectedCitiesState({super.cities});
}

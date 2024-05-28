import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/pages/tourPages/checkout_page.dart';
import 'package:tour_guide/view/pages/tourPages/confirm_details_page.dart';
import 'package:tour_guide/view/pages/tourPages/hotel_details_page.dart';
import 'package:tour_guide/view/pages/tourPages/select_hotel_page.dart';
import 'package:tour_guide/view/pages/tourPages/select_vehicle_page.dart';
import 'package:tour_guide/view/pages/tourPages/thanks_for_booking_page.dart';
import 'package:tour_guide/view/pages/tourPages/tour_page.dart';

class TourScreen extends StatelessWidget {
  TourScreen({super.key});
  final tourPages = [
    const TourPage(),
    const SelectHotelPage(),
    const HotelDetailsPage(),
    const SelectVehiclePage(),
    const ConfirmBookingDetailsPage(),
    const CheckoutPage(),
    const ThankyouForBookingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: tourPages[state.index],
        );
      },
    );
  }
}

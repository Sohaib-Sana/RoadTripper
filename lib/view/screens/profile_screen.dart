import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/view/pages/profilePages/login_and_security_page.dart';
import 'package:tour_guide/view/pages/profilePages/notification_page.dart';
import 'package:tour_guide/view/pages/profilePages/personal_info_page.dart';
import 'package:tour_guide/view/pages/profilePages/profile_page.dart';
import 'package:tour_guide/view/pages/profilePages/wishlist_page.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<Widget> profilePages = [
    const ProfilePage(),
    const WishlistPage(),
    PersonalInfoPage(),
    const LoginAndSecurityPage(),
    const NotificationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: profilePages[state.index],
        );
      },
    );
  }
}

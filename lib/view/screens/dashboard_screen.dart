import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/view/pages/home_page.dart';
import 'package:tour_guide/view/screens/profile_screen.dart';
import 'package:tour_guide/view/screens/tour_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = "/dashboard-screen";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    TourScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  void _changePage(int newPage) {
    setState(() {
      _currentIndex = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          canPop: false,
          child: PageView(
            controller: _pageController,
            onPageChanged: _changePage,
            children: _pages,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: deviceHeight(context) * 0.07,
          child: BottomNavigationBar(
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              currentIndex: _currentIndex,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.badge_outlined), label: "Tour"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.perm_identity_rounded), label: "Profile"),
              ]),
        ),
      ),
    );
  }
}

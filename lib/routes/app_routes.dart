import 'package:flutter/material.dart';
import 'package:tour_guide/view/pages/profilePages/login_and_security_page.dart';
import 'package:tour_guide/view/pages/profilePages/notification_page.dart';
import 'package:tour_guide/view/pages/profilePages/personal_info_page.dart';
import 'package:tour_guide/view/pages/profilePages/wishlist_page.dart';
import 'package:tour_guide/view/screens/dashboard_screen.dart';
import 'package:tour_guide/view/screens/runner_screen.dart';
import 'package:tour_guide/view/screens/splash_screen.dart';

class Routes {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RunnerScreen.id:
        return MaterialPageRoute(builder: (_) => const RunnerScreen());
      case DashboardScreen.id:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case WishlistPage.id:
        return MaterialPageRoute(builder: (_) => const WishlistPage());
      case PersonalInfoPage.id:
        return MaterialPageRoute(builder: (_) => const PersonalInfoPage());
      case LoginAndSecurityPage.id:
        return MaterialPageRoute(builder: (_) => const LoginAndSecurityPage());
      case NotificationPage.id:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      default:
        return MaterialPageRoute(builder: (_) => const RunnerScreen());
    }
  }
}

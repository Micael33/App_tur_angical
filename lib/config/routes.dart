import 'package:flutter/material.dart';
import '../features/auth/pages/login_page.dart';
import '../features/main/main_shell.dart';
import '../features/home/home_page.dart';
import '../features/events/pages/events_page.dart';
import '../features/tourist_spots/pages/tourist_spots_page.dart';
import '../features/services/pages/services_page.dart';
import '../features/profile/pages/profile_page.dart';
import '../features/categories/pages/categories_page.dart';
import '../features/categories/pages/category_details_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String main = '/main';
  static const String home = '/home';
  static const String events = '/events';
  static const String touristSpots = '/tourist-spots';
  static const String services = '/services';
  static const String profile = '/profile';
  static const String categories = '/categories';
  static const String categoryDetails = '/category-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: const RouteSettings(name: login),
        );
      case main:
        return MaterialPageRoute(
          builder: (_) => const MainShell(),
          settings: const RouteSettings(name: main),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: const RouteSettings(name: home),
        );
      case events:
        return MaterialPageRoute(
          builder: (_) => const EventsPage(),
          settings: const RouteSettings(name: events),
        );
      case touristSpots:
        return MaterialPageRoute(
          builder: (_) => const TouristSpotsPage(),
          settings: const RouteSettings(name: touristSpots),
        );
      case services:
        return MaterialPageRoute(
          builder: (_) => const ServicesPage(),
          settings: const RouteSettings(name: services),
        );
      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
          settings: const RouteSettings(name: profile),
        );
      case categories:
        return MaterialPageRoute(
          builder: (_) => const CategoriesPage(),
          settings: const RouteSettings(name: categories),
        );
      case categoryDetails:
        final categoryName = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => CategoryDetailsPage(categoryName: categoryName ?? ''),
          settings: const RouteSettings(name: categoryDetails),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const MainShell(),
          settings: const RouteSettings(name: main),
        );
    }
  }
}

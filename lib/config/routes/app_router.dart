import 'package:flutter/material.dart';
import 'package:recipes/config/routes/app_routes.dart';
import 'package:recipes/core/utils/app_strings.dart';
import 'package:recipes/features/home/presentation/pages/home_page.dart';
import 'package:recipes/features/on_boarding/on_boarding_page.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingPageRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );
      case AppRoutes.homePageRout:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      default:
        return _unDefinedRoute(settings);
    }
  }

  static Route? _unDefinedRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        ),
        settings: settings,
      );
}

import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/presentation.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';

class AppRouter {
  static Route onGeneratedRoutes(RouteSettings? settings) {
    switch (settings!.name) {
      case '/':
        return _materialRoute(const SplashView());
      case '/home':
        return _materialRoute(const HomeView());
      case '/details':
        return _materialRoute(DetailsView(
          movie: settings.arguments as Movie,
        ));
      default:
        return _materialRoute(const SplashView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

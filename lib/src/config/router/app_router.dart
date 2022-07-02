import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';

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

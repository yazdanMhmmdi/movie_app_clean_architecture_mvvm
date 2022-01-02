import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';

class AppTheme {
  static ThemeData? get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: IColors.background,
      primaryColor: IColors.redColor,
      splashColor: Colors.transparent,
      fontFamily: 'IranSans',
    );
  }
}

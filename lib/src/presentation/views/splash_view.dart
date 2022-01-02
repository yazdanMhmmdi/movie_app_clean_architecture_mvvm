import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/logo_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: IColors.background,
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}

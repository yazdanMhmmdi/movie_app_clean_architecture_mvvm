import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 80, height: 50, child: Image.asset(Assets.logo));
  }
}

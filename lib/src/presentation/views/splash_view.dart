import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../presentation.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pushToNextPage(context);
    return const Scaffold(
      backgroundColor: IColors.background,
      body: Center(
        child: LogoWidget(),
      ),
    );
  }

  void pushToNextPage(context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
    });
  }
}

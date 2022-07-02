import 'package:flutter/material.dart';

import '../../core/core.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 80, height: 50, child: Image.asset(Assets.logo));
  }
}

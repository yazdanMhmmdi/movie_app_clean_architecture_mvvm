import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        height: 50,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                "فیـ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: IColors.titleColor,
                ),
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              child: Text(
                "ـلیما",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: IColors.redColor,
                ),
              ),
            ),
          ],
        ));
  }
}

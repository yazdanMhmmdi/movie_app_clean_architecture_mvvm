import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          color: IColors.titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

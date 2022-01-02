import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 116.h,
            height: 159.h,
            color: Colors.green,
          ),
          Text(
            "اسپایدرمن: راهی به خانه نیست",
            style: TextStyle(
              color: IColors.titleColor,
              fontSize: 14.sp,
            ),
          ),
          Text(
            "2022",
            style: TextStyle(
              color: IColors.subTitleColor,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

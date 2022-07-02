import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../core/core.dart';

class RequestFailureWidget extends StatelessWidget {
  const RequestFailureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 200.w,
            height: 200.h,
            child: Lottie.asset(Assets.noNetworkLottie)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'ارتباط با سرور برقرار نشد از ارتباط خود با اینترنت مطمئن شوید و فیلترشکن خود را فعال کنید.',
            style: TextStyle(
              fontSize: 18.sp,
              color: IColors.titleColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    )
        //
        );
  }
}

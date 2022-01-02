import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';

class DetailsView extends StatefulWidget {
  final Movie movie;
  const DetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _header(),
          _footer(children: [
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'مرد عنکبوتی: راهی به خانه نیست',
                style: TextStyle(
                  color: IColors.titleColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                '2023',
                style: TextStyle(
                  color: IColors.subTitleColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Text(
                'این یکی متن اس',
                style: TextStyle(
                  color: IColors.subTitleColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      height: 392.h,
      color: Colors.red,
    );
  }

  Widget _footer({required List<Widget> children}) {
    return DraggableScrollableSheet(
        maxChildSize: 0.5,
        minChildSize: 0.5,
        builder: (_, __) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: children,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment(0.0, 0.0), stops: const [0.55, 0.65, 0.8, 1.0],
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
                colors: [
                  IColors.background.withOpacity(1.0),
                  IColors.background.withOpacity(.92),
                  IColors.background.withOpacity(.49),
                  IColors.background.withOpacity(0.0),
                ],
              ),
            ),
          );
        });
  }
}

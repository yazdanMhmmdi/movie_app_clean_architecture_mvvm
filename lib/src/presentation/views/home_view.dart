import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/logo_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/movie_item_widget.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/title_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 39.h),
            const Center(child: LogoWidget()),
            SizedBox(height: 39.h),
            TitleWidget(text: "به زودی"),
            SizedBox(height: 16.h),
            SizedBox(
              height: 198.h,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TitleWidget(text: "محبوب ترین ها"),
            SizedBox(height: 16.h),
            SizedBox(
              height: 198.h,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                  MovieItemWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

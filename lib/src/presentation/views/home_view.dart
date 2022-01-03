import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/presentation.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<HomeViewModel>(builder: (_, value, __) {
        return Stack(
          children: [
            if (value.loading) ...[
              const LoadingWidget()
            ] else if (value.error) ...[
              const RequestFailureWidget(),
            ] else ...[
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      const Center(child: LogoWidget()),
                      SizedBox(height: 16.h),
                      TitleWidget(text: "به زودی"),
                      SizedBox(height: 16.h),
                      _upcomingListView(value),
                      SizedBox(height: 20.h),
                      TitleWidget(text: "محبوب ترین ها"),
                      SizedBox(height: 16.h),
                      _popularLostView(value),
                    ],
                  ),
                ),
              ),
            ]
          ],
        );
      }),
    ));
  }

  _popularLostView(HomeViewModel value) {
    return _listView(value.popularMovies);
  }

  _upcomingListView(HomeViewModel value) {
    return _listView(value.upcomingMovies);
  }

  _listView(List<Movie>? popularMovies) {
    return SizedBox(
        height: 198.h,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            ...List<Widget>.from(
              popularMovies!.map(
                (e) => Builder(
                  builder: (context) => MovieItemWidget(
                    movieModel: e,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: e,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

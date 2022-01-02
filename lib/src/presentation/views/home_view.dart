import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/assets.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/view_models/home_view_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/logo_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/movie_item_widget.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/request_failure_widget.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: Consumer<HomeViewModel>(builder: (_, value, __) {
        return Stack(
          children: [
            if (value.loading) ...[
              Center(
                child: LoadingAnimationWidget.staggeredDotWave(
                    color: IColors.titleColor, size: 40),
              ),
            ] else if (value.error) ...[
              const RequestFailureWidget(),
            ] else ...[
              SingleChildScrollView(
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
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ...List<Widget>.from(
                              value.upcomingMovies!.map(
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
                            ),
                          ],
                        )),
                    SizedBox(height: 20.h),
                    TitleWidget(text: "محبوب ترین ها"),
                    SizedBox(height: 16.h),
                    SizedBox(
                        height: 198.h,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ...List<Widget>.from(
                              value.popularMovies!.map(
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
                        )),
                  ],
                ),
              ),
            ]
          ],
        );
      }),
    ));
  }
}

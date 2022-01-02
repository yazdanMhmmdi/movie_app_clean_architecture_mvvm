import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture_mvvm/src/config/router/app_router.dart';
import 'package:movie_app_clean_architecture_mvvm/src/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640), //TODO:
      minTextAdapt: true,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.dark,
        onGenerateRoute: AppRouter.onGeneratedRoutes,
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    );
  }
}

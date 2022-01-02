import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture_mvvm/src/config/router/app_router.dart';
import 'package:movie_app_clean_architecture_mvvm/src/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/injector.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/view_models/home_view_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/widgets/custom_scroll_behavior.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => injector(),
      child: ScreenUtilInit(
        designSize: const Size(360, 640), //TODO:
        minTextAdapt: true,
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.dark,
          onGenerateRoute: AppRouter.onGeneratedRoutes,
          scrollBehavior: MyCustomScrollBehavior(),
        ),
      ),
    );
  }
}

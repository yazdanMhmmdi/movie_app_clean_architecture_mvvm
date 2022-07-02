import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/config/config.dart';
import 'src/injector.dart';
import 'src/presentation/presentation.dart';

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
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: () => MaterialApp(
          title: 'فیلیما',
          theme: AppTheme.dark,
          onGenerateRoute: AppRouter.onGeneratedRoutes,
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

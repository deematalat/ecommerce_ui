import 'package:ecommerce_mobile_ui/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';
import 'core/theming/colors.dart';

class EcommApp extends StatelessWidget {
  const EcommApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(750, 1334),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Doc App',
          theme: ThemeData(
            appBarTheme:AppBarTheme(
              color: Colors.white
            ),
            primaryColor: ColorsManager.mainRed,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}

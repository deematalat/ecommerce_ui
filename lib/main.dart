import 'package:ecommerce_mobile_ui/ecomm_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(EcommApp(
    appRouter: AppRouter(),
  ));
}

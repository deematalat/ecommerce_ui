import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:ecommerce_mobile_ui/features/pages/widgets/home_screen_page_view.dart';
import 'package:ecommerce_mobile_ui/features/categories/widgets/main_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeScreenPageView(),
              const MainCategoriesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

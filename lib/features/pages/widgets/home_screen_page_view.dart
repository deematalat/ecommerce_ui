import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../onboarding/widgets/dot_indicators.dart';

class HomeScreenPageView extends StatefulWidget {
  const HomeScreenPageView({Key? key}) : super(key: key);

  @override
  State<HomeScreenPageView> createState() => _HomeScreenPageViewState();
}

class _HomeScreenPageViewState extends State<HomeScreenPageView> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<String> _ImageData = [
    "assets/images/pageview1.jpg",
    "assets/images/pageview2.jpg",
    "assets/images/pageview3.jpg",
    "assets/images/pageview2.jpg",
    "assets/images/pageview1.jpg"
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600.h,
      child: Stack(children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _ImageData.length,
          onPageChanged: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          itemBuilder: (context, index) => Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  _ImageData[index],
                  fit: BoxFit.cover,
                ),
              ),
              // Translucent Banner
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Colors.white.withOpacity(0.5),
                  // Translucent black
                  child: Column(
                    children: [
                      Text(
                        'International Brands',
                        style: TextStyles.font26BlackBold,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Flat 50% OFF',
                        style: TextStyles.font24RedBold,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              // Button at the Bottom
              Positioned(
                bottom: 170.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 250.w,
                  ),
                  child: AppTextButton(
                    buttonWidth: 500.w,
                    onPressed: () {
                     context.pushNamed(Routes.productsScreen);
                    },
                    backgroundColor: Colors.white,
                    buttonText: 'Shop Now',
                    textStyle: TextStyles.font26RedRegular,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...List.generate(
              _ImageData.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 4.w),
                child: DotIndicator(isActive: index == _pageIndex),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

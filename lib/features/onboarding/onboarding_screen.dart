import 'package:ecommerce_mobile_ui/features/onboarding/widgets/dot_indicators.dart';
import 'package:ecommerce_mobile_ui/features/onboarding/widgets/onbording_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/images/onboarding1.png",
      title: "Welcome to Shop Club",
      description:
          "We’re the Shop Club and here to make your life easier. Just rel.",
    ),
    Onbord(
      image: "assets/images/onboarding1.png",
      title: "Get those shopping \nbags filled",
      description:
          "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onbord(
      image: "assets/images/onboarding1.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onbord(
      image: "assets/images/onboarding1.png",
      title: "Package tracking",
      description:
          "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onbord(
      image: "assets/images/onboarding1.png",
      title: "Nearby stores",
      description:
          "Easily track nearby shops, browse through their items and get information about their prodcuts.",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: _onbordData[index].image,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 60.w),
                child: AppTextButton(
                  backgroundColor: ColorsManager.mainRed,
                  buttonText: 'Shop now',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                  textStyle: TextStyles.font26WhiteBold,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ...List.generate(
                  _onbordData.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 4.w),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
  });
}

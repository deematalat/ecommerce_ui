import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageSrc,
    this.proLableText = "Pro",
    this.isPro = false,
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
  });

  final String name, email, imageSrc;
  final String proLableText;
  final bool isPro, isShowHi, isShowArrow;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(50.h),
      color: ColorsManager.moreLighterGray,
      child:Column(children: [
        verticalSpace(16),
        CircleAvatar(
          radius: 50,
          child: Image.asset(
            "assets/images/man.png",
          ),
        ),
        verticalSpace(16),
            Text(
              isShowHi ? "Hi, $name" : name,
              style: const TextStyle(fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        verticalSpace(16),
        Text(email)
      ],),
    );
  }
}
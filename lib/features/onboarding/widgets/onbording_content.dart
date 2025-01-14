import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';

class OnbordingContent extends StatelessWidget {
  const OnbordingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        /// if you are using SVG then replace [Image.asset] with [SvgPicture.asset]

        Image.asset(
          image,
          width: 500.h,
          height: 500.h,
        ),
        verticalSpace(100.h),
        OnbordTitleDescription(
          title: title,
          description: description,
        ),

        const Spacer(),
      ],
    );
  }
}

class OnbordTitleDescription extends StatelessWidget {
  const OnbordTitleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style:TextStyles.font26BlackBold

          ),
        verticalSpace(50.h),
        Padding(
          padding:EdgeInsets.symmetric(horizontal:8.w),
          child: Text(
            description,
            style: TextStyles.font26GrayRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

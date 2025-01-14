import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font26WhiteBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font24RedBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.red,
  );
  static TextStyle font46RedBold = TextStyle(
    fontSize: 46.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.red,
  );
  static TextStyle font24BlueBold= TextStyle(
    color: Color(0xFF31B0D8),
    fontSize: 24.sp,
    fontWeight:FontWeightHelper.medium,
  );
  static TextStyle font18underline= TextStyle(
  color:ColorsManager.gray,
  fontSize: 18.sp,
  decoration: TextDecoration.lineThrough,
  );
  static TextStyle font26GrayRegular = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );
  static TextStyle font26BlackBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font18GrayBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.grey,
  );
  static TextStyle font20GreenRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.green,
  );
  static TextStyle font30BlackRegular = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font10BlackRegular = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font26RedRegular = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.red,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font18blackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font38blackBold = TextStyle(
    fontSize: 38.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font14DarkRedMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.red.shade700,
  );
  static TextStyle font26LightGrayRegular = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey.shade300,
  );
  static TextStyle font18WhiteMedium=TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeightHelper.medium,
  );
}

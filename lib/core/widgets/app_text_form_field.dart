import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/input_decoration_theme.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.font26BlackBold,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusColor: ColorsManager.gray,
        focusedBorder: focusedBorder ?? focusedUnderlineInputBorder,
        enabledBorder: enabledBorder ?? UnderlineInputBorder(),
        errorBorder: UnderlineInputBorder(),
        focusedErrorBorder: UnderlineInputBorder(),
        hintStyle: hintStyle ?? TextStyles.font26LightGrayRegular,
        hintText: hintText,
        prefixIcon: suffixIcon,
        fillColor: backgroundColor ?? Colors.white70,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}

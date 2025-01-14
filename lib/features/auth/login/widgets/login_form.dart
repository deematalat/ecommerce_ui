import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/validator.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: emaildValidator.call,
            hintText: "Email address",
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h * 0.75),
              child: SvgPicture.asset(
                "assets/icons/Message.svg",
                height: 5.h,
                width: 5.w,
                colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.3),
                    BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            validator: passwordValidator.call,
            isObscureText: true,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h * 0.75),
              child: SvgPicture.asset(
                "assets/icons/Lock.svg",
                height: 5.h,
                width: 5.w,
                colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.3),
                    BlendMode.srcIn),
              ),
            ),
            hintText: "Password",
          ),
        ],
      ),
    );
  }
}

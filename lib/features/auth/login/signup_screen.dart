import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/features/auth/login/widgets/sign_up_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 50.h
          ),
          child: Column(
            children: [
              verticalSpace(50),
              Image.asset(
                fit: BoxFit.cover,
                height:250.h ,
                width:250.w ,
                "assets/images/onboarding1.png",
              ),
              Padding(
                padding:  EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(100),
                     SizedBox(height:16.h),
                    SignUpForm(formKey: _formKey),
                    verticalSpace(50),
                     SizedBox(height:16.h),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {},
                          value: false,
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree with the",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushNamed(
                                          Routes.entryPointScreen);
                                    },
                                  text: " Terms of service ",
                                  style: const TextStyle(
                                    color:ColorsManager.mainRed,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(
                                  text: "& privacy policy.",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                     SizedBox(height: 16.h * 2),
                    AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.entryPointScreen);
                      },
                      buttonText:"Continue",
                      textStyle:TextStyles.font26WhiteBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.loginScreen);
                          },
                          child:Text("Log in",style:TextStyles.font26RedRegular,),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
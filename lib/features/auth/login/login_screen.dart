import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/features/auth/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        leading:Container(),
        actions:[
          TextButton(onPressed: () {
            context.pushNamed(Routes.entryPointScreen);
          },
          child:Text("Skip",style:TextStyles.font26GrayRegular,))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 50.h
          ),
          child: Column(
            children: [
              verticalSpace(50),
              Image.asset(
                "assets/images/onboarding1.png",
                fit: BoxFit.cover,
                height:250.h ,
                width:250.w ,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(100),
                  LogInForm(formKey: _formKey),
                  verticalSpace(50),
                  AppTextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushNamedAndRemoveUntil(
                            Routes.entryPointScreen,
                            predicate:   ModalRoute.withName(Routes.loginScreen),);
                      }
                    },
                    buttonText: "Log in", textStyle: TextStyles.font26WhiteBold,

                  ),
                  Align(
                    child: TextButton(
                      child: Text("Forgot password",style:TextStyles.font26RedRegular,),
                      onPressed: () {
                        context.pushNamed(
                            Routes.passwordRecoveryScreen);
                      },
                    ),
                  ),
                  verticalSpace(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.signUpScreen);
                        },
                        child:  Text("Sign up",style:TextStyles.font26RedRegular,),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
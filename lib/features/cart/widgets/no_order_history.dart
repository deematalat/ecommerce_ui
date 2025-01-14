

import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';


class NoOrderHistory extends StatelessWidget {
  const NoOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Container(
            margin:EdgeInsets.all(30),
            child: Image.asset('assets/images/noHistory.png',fit:BoxFit.cover,),),
          Text(
            'No history yet',
            style:TextStyles.font24RedBold,
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
          ),
          SizedBox(height:10,),
          Text(
            'Hit the button down below to \nCreate an order',
            style:TextStyles.font26GrayRegular,
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
          ),
          SizedBox(height:10,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppTextButton(textStyle:TextStyles.font26WhiteBold, buttonText: 'Start ordering',
              onPressed:(){
              context.pushNamed(Routes.productsScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderConfirmationScreen extends StatelessWidget {
  final String orderNumber = "#2568P458512DE";
  final String arrivalDate = "Saturday, March 26";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order Confirmation"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Smart box is on the way!",
              style:TextStyles.font46RedBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            Text(
              "Order Number: $orderNumber",
              style:TextStyles.font26GrayRegular ,
            ),
            verticalSpace(30),
            Image.asset(
              'assets/delivery_truck.png', // Replace with your truck image path
              width: 200.w,
              height: 200.h,
            ),
            verticalSpace(30),
            Text(
              "Scheduled Arrival Date",
              style:  TextStyles.font30BlackRegular,
            ),
            verticalSpace(10),
            Text(
              arrivalDate,
              style: TextStyles.font38blackBold,
            ),
            Spacer(),
            // Action Buttons
            AppTextButton(
              buttonText:"VIEW OR MANAGE ORDER" ,
              textStyle:TextStyles.font26WhiteBold,
              onPressed: () {
                // Logic to view or manage order
                print("View or Manage Order");
              },
            ),
            verticalSpace(20),
            Padding(
              padding:  EdgeInsets.symmetric(
                          horizontal: 12.w,vertical: 14.h
              ),
              child: OutlinedButton(
                onPressed: () {
                  // Logic to continue shopping
                  print("Continue Shopping");
                },
                child: Text("CONTINUE SHOPPING"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PaymentScreen extends StatelessWidget {
  final double totalAmount = 3796.00; // Example amount
  final String walletBalance = "Rs. 8,584"; // Example wallet balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("TOTAL: Rs. $totalAmount",
                style: TextStyle(fontSize: 24, color: Colors.red)),
            verticalSpace(30),
            PaymentMethodCard(
              icon: Icons.account_balance_wallet,
              title: "Wallet",
              subtitle: "Current Balance:$walletBalance",
              onTap: () {
                // Wallet payment logic
                print("Wallet selected");
              },
            ),
            PaymentMethodCard(
              icon: Icons.payment,
              title: "Paypal",
              subtitle: "sandeepkasundra@gmail.com",
              onTap: () {
                // PayPal payment logic
                print("PayPal selected");
              },
            ),
            PaymentMethodCard(
              icon: Icons.card_membership,
              title: "Visa",
              subtitle: "** ** ** 7258",
              onTap: () {
                // Visa payment logic
                print("Visa selected");
              },
            ),
            verticalSpace(30),
            GestureDetector(
              onTap: () {
                // Logic to add a new payment method
                print("Add New Payment Method");
              },
              child: Text("+ Add New Payment Method",
                  style: TextStyle(color: Colors.red)),
            ),
            Spacer(),
            Text("SHIP TO", style: TextStyle(fontWeight: FontWeight.bold)),
            verticalSpace(20),
            Text(
                "2948 Cambridge Court, Indian Trail\nSan Francisco, CA, 10063, USA"),
            Spacer(),
            Center(
              child: AppTextButton(
                textStyle:TextStyles.font26WhiteBold,
                buttonText: "Pay Now",
                onPressed: () {
                  context.pushNamed(Routes.orderConfirmation);
                  print("Pay Now");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PaymentMethodCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.red),
           horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  verticalSpace(10),
                  Text(subtitle, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

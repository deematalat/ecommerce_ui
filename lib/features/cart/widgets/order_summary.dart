import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';

class OrderSummary extends StatelessWidget {
  final double bagTotal;
  final double couponDiscount;
  final double totalPayable;

  OrderSummary({required this.bagTotal, required this.couponDiscount, required this.totalPayable});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bag Total: Rs. ${bagTotal.toString()}", style: TextStyle(fontSize: 16)),
            Text("Bag Discount: -Rs.${couponDiscount.toString()}", style: TextStyle(color: Colors.red)),
            Divider(),
            Text("Total Payable: Rs. ${totalPayable.toString()}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}

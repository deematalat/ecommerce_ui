import 'package:flutter/material.dart';
import 'package:ecommerce_mobile_ui/core/widgets/menu_item_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCouponAndGift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical:20.h),
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuListTile(text: 'Apply Coupon', press: () {},svgSrc:'assets/icons/Coupon.svg',),
          MenuListTile(text: 'Gift Wrap', press: () {},isShowDivider: false,svgSrc:'assets/icons/Cash.svg',),
        ],
      ),
    );
  }
}

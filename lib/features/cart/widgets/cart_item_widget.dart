import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import '../../product/model/product_model.dart';


class CartItemWidget extends StatelessWidget {
  final ProductModel item;
  final VoidCallback onRemove; // Callback to handle item removal
  final int index;
  CartItemWidget({required this.item, required this.onRemove,required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(
        bottom: 10.h,
        top: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  height: 300.h,
                  width: double.maxFinite,
                  child: Image.asset(item.image, fit: BoxFit.fill),
                ),

                // Product Info & Edit Button
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: TextStyles.font18blackBold),
                          verticalSpace(5),
                          Text(
                            "Rs. ${item.priceAfetDiscount} (Rs.${item.price})",
                            style: TextStyles.font18GrayBold,
                          ),
                          Text(
                            "${item.dicountpercent}% OFF",
                            style: TextStyle(color: Colors.green),
                          ),
                          verticalSpace(5),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.red),
                          onPressed: () {
                            context.pushNamed(
                                     Routes.productDetailsScreen, arguments: {
                                'isEdit': true,
                                'product': item, // Pass the current product details
                                'index': index,  // Optional, for easier tracking
                              },
                            );
                          },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Remove Icon (X)
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: onRemove, // Trigger the remove action
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                padding: EdgeInsets.all(8.h),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

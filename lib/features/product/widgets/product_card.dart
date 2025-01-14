import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
    required this.press,
    required this.likeOnprees

  });

  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final VoidCallback press,likeOnprees;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset(image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandName.toUpperCase(),
                        style: TextStyles.font26BlackBold,
                      ),
                      verticalSpace(16),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font18blackBold,
                      ),
                      const Spacer(),
                      priceAfetDiscount != null
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$$priceAfetDiscount",
                            style:TextStyles.font24BlueBold
                          ),
                          horizontalSpace(16),
                          Text(
                            "\$$price",
                            style:TextStyles.font18underline
                          ),
                          if (dicountpercent != null)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              height: 25.h,
                              decoration: const BoxDecoration(
                                color: ColorsManager.green,
                                borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Text(
                                "$dicountpercent% off",
                                style:TextStyles.font18WhiteMedium
                            ),),
                        ],
                      )
                          : Text(
                        "\$$price",
                        style:TextStyles.font24BlueBold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed:likeOnprees,
            ),
          ),
        ],
      ),
    );
  }
}



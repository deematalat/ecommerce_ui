import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SecondaryProductCard extends StatelessWidget {
  const SecondaryProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
    this.press,
    this.style,
  });
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final VoidCallback? press;

  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: style ??
          OutlinedButton.styleFrom(
              minimumSize: const Size(256, 114),
              maximumSize: const Size(256, 114),
              padding: const EdgeInsets.all(8)),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                if (dicountpercent != null)
                  Positioned(
                    right:16,
                    top:16,
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 16.w),
                      height: 16,
                      decoration: const BoxDecoration(
                        color: ColorsManager.errorColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(25)),
                      ),
                      child: Text(
                        "$dicountpercent% off",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
              ],
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10),
                  ),
                 verticalSpace(16),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  priceAfetDiscount != null
                      ? Row(
                    children: [
                      Text(
                        "\$$priceAfetDiscount",
                        style: const TextStyle(
                          color: Color(0xFF31B0D8),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                     horizontalSpace(16),
                      Text(
                        "\$$price",
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
                      : Text(
                    "\$$price",
                    style: const TextStyle(
                      color: Color(0xFF31B0D8),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
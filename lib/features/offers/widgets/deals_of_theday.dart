import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../offers_screen.dart';
import 'brand_offer_card.dart';

Widget buildDealsOfTheDay(brandOffers) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("DEALS OF THE DAY", style:TextStyles.font26BlackBold),
            TextButton(
              onPressed: () {
                // Handle see all action
                print("See All clicked");
              },
              child: Text("See All"),
            ),
          ],
        ),
        verticalSpace(10),
        SizedBox(
          height: 400.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: brandOffers.length,
            itemBuilder: (context, index) {
              return BrandOfferCard(brandOffer: brandOffers[index]);
            },
          ),
        ),

      ],
    ),
  );
}
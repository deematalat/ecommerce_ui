
import 'package:flutter/material.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../offers_screen.dart';
import 'brand_offer_card.dart';

Widget buildTopBrandsOffers(brandOffers) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("TOP BRANDS OFFERS", style:TextStyles.font26BlackBold),
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
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          physics: NeverScrollableScrollPhysics(), // Disable scroll in grid
          shrinkWrap: true,
          itemCount: brandOffers.length,
          itemBuilder: (context, index) {
            return BrandOfferCard(brandOffer: brandOffers[index]);
          },
        ),

      ],
    ),
  );
}
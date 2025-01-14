import 'package:flutter/material.dart';
import '../../../core/theming/styles.dart';

import '../model/offer_model.dart';

class BrandOfferCard extends StatelessWidget {
  final BrandOffer brandOffer;

  const BrandOfferCard({Key? key, required this.brandOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(brandOffer.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              brandOffer.title,
              style:TextStyles.font26BlackBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              brandOffer.discount,
              style:TextStyles.font14DarkRedMedium,
            ),
          ),
        ],
      ),
    );
  }
}
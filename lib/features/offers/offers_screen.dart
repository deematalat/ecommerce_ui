import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/features/offers/widgets/deals_of_theday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../categories/category_menu.dart';
import 'model/offer_model.dart';
import 'widgets/top_brands_offers.dart';

import '../../core/routing/routes.dart';
class OffersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.moreLighterGray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildFeaturedOffer((){
                context.pushNamed(Routes.productsScreen);
              },),
              buildTopBrandsOffers(brandOffers),
              buildDealsOfTheDay(brandOffers),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFeaturedOffer(onpressed) {
    return categoryPageView(
      onPressed:onpressed,
    );
  }
}



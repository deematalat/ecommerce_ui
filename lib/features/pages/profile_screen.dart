import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/features/pages/widgets/profile_card.dart';
import 'package:ecommerce_mobile_ui/core/widgets/menu_item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: ColorsManager.moreLighterGray,
      body:   ListView(
          children: [
            ProfileCard(
              name: "Sepide",
              email: "theflutterway@gmail.com",
              imageSrc: "https://i.imgur.com/IXnwbLk.png",

              press: () {},
            ),
            verticalSpace(8.h),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal:50.w
              ),
              child: Card(
                color: Colors.white,
                child:Column(
                    children:[
                      MenuListTile(
                        text: "Wishlist",
                        svgSrc: "assets/icons/Like.svg",
                        press: () {
                          context.pushNamed(Routes.favscreen);
                        },
                      ),
                      MenuListTile(
                        text: "My Orders",
                        svgSrc: "assets/icons/Bag.svg",
                        press: () {
                          context.pushNamed(Routes.cartcreen);
                        },
                      ),
                      MenuListTile(
                        text: "Saved Cards",
                        svgSrc: "assets/icons/Cash.svg",
                        press: () {

                        },
                      ),
                      MenuListTile(
                        text: "Coupons",
                        svgSrc: "assets/icons/Coupon.svg",
                        press: () {
                          context.pushNamed(Routes.offersScreen);
                        },
                      ),
                      MenuListTile(
                        text: "Settings",
                        svgSrc: "assets/icons/Setting.svg",
                        press: () {},
                      ),
                      MenuListTile(
                        text: "Logout",
                        svgSrc: "assets/icons/Logout.svg",
                        press: () {},
                        isShowDivider: false,
                      ),
                ]),
              ),
            ),
          ],
        ),
    );
  }
}

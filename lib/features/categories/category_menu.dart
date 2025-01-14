import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/features/categories/widgets/visable_subcategory_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/routes.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/menu_item_list_tile.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  int selectedIndex = -1;
  final List<String> wFSubcategories = [
    "Footwear",
    "Dresses",
    "Tops",
    "Bottoms",
    "Accessories",
    "Bags",
    "Jewelry",
    "Sunglasses",
    "Beauty",
    "Underwear",
  ];

  // Map each category to its corresponding subcategories
  final Map<String, List<String>> subcategoriesMap = {
    "Footwear": ["Sneakers", "Boots", "Sandals", "Heels"],
    "Dresses": ["Maxi", "Mini", "Midi", "Casual", "Formal"],
    "Tops": ["T-shirts", "Shirts", "Blouses", "Sweaters", "Hoodies"],
    "Bottoms": ["Jeans", "Pants", "Shorts", "Skirts", "Leggings"],
    "Accessories": ["Hats", "Scarves", "Belts", "Gloves"],
    "Bags": ["Handbags", "Tote Bags", "Backpacks", "Wallets"],
    "Jewelry": ["Necklaces", "Earrings", "Rings", "Bracelets"],
    "Sunglasses": ["Aviator", "Wayfarer", "Round", "Square"],
    "Beauty": ["Makeup", "Skincare", "Haircare", "Fragrance"],
    "Underwear": ["Bras", "Panties", "Socks"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        // floating: true,
        // snap: true,
        elevation: 0.5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("woman fashion"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchScreen);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              colorFilter:
                  ColorFilter.mode(ColorsManager.gray, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          categoryPageView(onPressed:(){
            context.pushNamed(Routes.productsScreen);
          },),
          Container(
            color: ColorsManager.moreLighterGray,
            child: ListView.builder(
              key: ValueKey(wFSubcategories),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: wFSubcategories.length,
              itemBuilder: (BuildContext context, int index) {
                final subcategory = wFSubcategories[index];
                return SizedBox(
                  child: Column(
                    children: [
                      MenuListTile(
                        text: subcategory,
                        press: () {
                          setState(() {
                            selectedIndex = selectedIndex == index ? -1 : index;
                            print(selectedIndex);
                          });
                        },
                      ),
                      Container(
                        color: Colors.white,
                        child: VisableSubcategoryMenu(
                          isClicked: selectedIndex == index,
                          category: subcategoriesMap,
                          onTap: () {
                            context.pushNamed(Routes.productsScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class categoryPageView extends StatelessWidget {
  const categoryPageView({
    super.key, required this.onPressed,
  });
final Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/pageview1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Translucent Banner
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200.h,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white.withOpacity(0.5),
              // Translucent black
              child: Column(
                children: [
                  Text(
                    'International Brands',
                    style: TextStyles.font26BlackBold,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Flat 50% OFF',
                    style: TextStyles.font24RedBold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          // Button at the Bottom
          Positioned(
            bottom: 170.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 250.w,
              ),
              child: AppTextButton(
                buttonWidth: 500.w,
                onPressed:onPressed!,
                backgroundColor: ColorsManager.mainRed,
                buttonText: 'Shop Now',
                textStyle: TextStyles.font26WhiteBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:ecommerce_mobile_ui/core/helpers/spacing.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/widgets/menu_item_list_tile.dart';
import 'package:ecommerce_mobile_ui/features/pages/widgets/side_bar_menu.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  static const route="/side_menu";
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ColorsManager.mainRed,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(70),
              ...sidebarMenus
                  .map((menu) => MenuListTile(
                text:menu.title,
                press: () {  },


              ))
                  .toList(),
              Spacer(),

            ],
          ),
        ),
      ),

    ) ;
  }
}
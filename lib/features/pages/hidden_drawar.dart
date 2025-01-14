
import 'package:ecommerce_mobile_ui/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../../core/theming/styles.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  int _currentIndex = 0;

  final List<String> menuItems = [
    "Shop",
    "Offers",
    "Wishlist",
    "Cart",
    "Profile",
  ];

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: menuItems.map((item) {
        final int index = menuItems.indexOf(item);

        return ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: item,
            baseStyle: TextStyle(color: Colors.white, fontSize: 16),
            selectedStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            onTap: () {
              _onIndexChanged(index); // Synchronize index
            },
          ),
          EntryPoint(),
        );
      }).toList(),
      backgroundColorMenu: Colors.red,
      initPositionSelected: _currentIndex,
    );
  }
}



import 'package:animations/animations.dart';
import 'package:ecommerce_mobile_ui/features/offers/offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'core/theming/colors.dart';
import 'features/cart/cart_screen.dart';
import 'features/product/fav_screen.dart';
import 'features/pages/home_screen.dart';
import 'features/pages/profile_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => EntryPointState();
}

class EntryPointState extends State<EntryPoint> {
  final List _pages = [
    HomeScreen(),
    OffersScreen(),
    FavScreen(),
    ShoppingCartScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;
  void setIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation, secondAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondAnimation,
              child: child,
            );
          },
          child: _pages[_currentIndex],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index != _currentIndex) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : const Color(0xFF101015),
            type: BottomNavigationBarType.fixed,
            // selectedLabelStyle: TextStyle(color: primaryColor),
            selectedFontSize: 12,
            selectedItemColor: ColorsManager.mainRed,
            unselectedItemColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Category.svg"),
                activeIcon: svgIcon("assets/icons/Category.svg",
                    color: ColorsManager.mainRed),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Shop.svg"),
                activeIcon: svgIcon("assets/icons/Shop.svg",
                    color: ColorsManager.mainRed),
                label: "Offer",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bookmark.svg"),
                activeIcon: svgIcon("assets/icons/Bookmark.svg",
                    color: ColorsManager.mainRed),
                label: "Wish",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bag.svg"),
                activeIcon: svgIcon("assets/icons/Bag.svg",
                    color: ColorsManager.mainRed),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Profile.svg"),
                activeIcon: svgIcon("assets/icons/Profile.svg",
                    color: ColorsManager.mainRed),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

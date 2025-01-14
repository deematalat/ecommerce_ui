import 'package:ecommerce_mobile_ui/core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/features/categories/category_menu.dart';
import 'package:ecommerce_mobile_ui/features/pages/hidden_drawar.dart';
import 'package:ecommerce_mobile_ui/features/offers/offers_screen.dart';
import 'package:ecommerce_mobile_ui/features/cart/order_confirmation.dart';
import 'package:ecommerce_mobile_ui/features/product/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/login/login_screen.dart';
import '../../features/auth/login/signup_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/cart/cart_screen.dart';
import '../../features/cart/address_screen.dart';
import '../../features/product/fav_screen.dart';
import '../../features/pages/home_screen.dart';
import '../../features/cart/payment_screen.dart';
import '../../features/pages/profile_screen.dart';
import '../../features/product/product_screen.dart';
import '../../features/product/search_screen.dart';

import '../../features/product/widgets/refine_twopane.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.entryPointScreen:
        return MaterialPageRoute(
          builder: (_) =>  HiddenDrawer(),
        );
      /*case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );*/
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.profilescreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.cartcreen:
        return MaterialPageRoute(
          builder: (_) =>  ShoppingCartScreen(),
        );
      case Routes.favscreen:
        return MaterialPageRoute(
          builder: (_) =>  FavScreen(),
        );
      case Routes.offersScreen:
        return MaterialPageRoute(
          builder: (_) =>  OffersScreen(),
        );
      case Routes.categoryMenu:
        return MaterialPageRoute(
          builder: (_) => const CategoryMenu(),
        );
      case Routes.productsScreen:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: const ProductScreen()),
        );
      case Routes.addressScreen:
        return MaterialPageRoute(
          builder: (_) => AddressEntryScreen(),
        );

     case Routes.twoPaneScreen:
        return MaterialPageRoute(
          builder: (_) => const TwoPaneScreen(
            restorationId: '',
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => ProductSearchScreen(),);
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(),);
      case Routes.orderConfirmation:
        return MaterialPageRoute(
          builder: (_) => OrderConfirmationScreen(),);
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(),);
      default:
        return null;
    }
  }
}

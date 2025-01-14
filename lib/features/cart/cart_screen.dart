
import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:ecommerce_mobile_ui/core/theming/styles.dart';
import 'package:ecommerce_mobile_ui/core/widgets/app_text_button.dart';
import 'package:ecommerce_mobile_ui/features/cart/widgets/cart_coupon_and_gift.dart';
import 'package:ecommerce_mobile_ui/features/cart/widgets/cart_item_grid.dart';
import '../../core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/features/cart/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../product/model/product_model.dart';
import 'widgets/no_order_history.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final ProductManager _productManager = ProductManager();

  late List<ProductModel> items;
  @override
  void initState() {
   items= _productManager.getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bagTotal = 5000;
    double couponDiscount = 1889;
    double totalPayable = bagTotal - couponDiscount;
    return Scaffold(
      backgroundColor: ColorsManager.moreLighterGray,
      body: SafeArea(
        child: items.isEmpty
            ? NoOrderHistory()
            : CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("TOTAL BAG .....", style: TextStyles.font24RedBold,textAlign: TextAlign.center,),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height:500.h, // Adjust height as needed
                child: Center(child: CartItemGrid(items: items)),
              ),
            ),
            SliverToBoxAdapter(
              child: CartCouponAndGift(),
            ),
            SliverToBoxAdapter(
              child: OrderSummary(
                bagTotal: bagTotal,
                couponDiscount: couponDiscount,
                totalPayable: totalPayable,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AppTextButton(
                  buttonText: 'Order Now',
                  textStyle: TextStyles.font26WhiteBold,
                  onPressed: () {
                    context.pushNamed(Routes.addressScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

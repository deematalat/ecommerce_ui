import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/routing/routes.dart';
import 'package:ecommerce_mobile_ui/features/cart/widgets/no_order_history.dart';
import '../../core/widgets/show_snack_bar.dart';
import 'model/product_model.dart';
import 'widgets/product_secand_card.dart';

class FavScreen extends StatefulWidget {
   FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final ProductManager _productManager = ProductManager();
  late List<ProductModel> items;
  @override
  void initState() {
    items= ProductManager().getWishProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.moreLighterGray,
        body:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: items.isEmpty
              ? NoOrderHistory(): Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final product = items[index];
                    return Dismissible(
                      confirmDismiss: (DismissDirection direction) async {
                        showSnackBar(context,"remove item from wish");
                        return true;
                      },
                      onDismissed: (DismissDirection direction) {
                        _productManager.removeFromWishlist(index);
                        setState(() {});
                      },
                      direction: DismissDirection.endToStart,
                      key:ValueKey(index),
                      child: ProductSecandCard(
                        product: product,
                        onTap: () {
                          //todo:when click nav to product details screen
                          context.pushNamed(Routes.productDetailsScreen,
                              arguments: {'index': index});
                          // Navigate to product details screen or take any other action
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        ),
    );

  }
}
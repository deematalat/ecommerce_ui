import 'package:flutter/material.dart';
 import 'package:ecommerce_mobile_ui/features/product/model/product_model.dart';
import 'cart_item_widget.dart';
import 'no_order_history.dart';
class CartItemGrid extends StatefulWidget {
  final List<ProductModel> items;

   CartItemGrid({Key? key, required this.items}) : super(key: key);

  @override
  State<CartItemGrid> createState() => _CartItemGridState();
}

class _CartItemGridState extends State<CartItemGrid> {
  final ProductManager _productManager = ProductManager();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:1,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return CartItemWidget(item: widget.items[index],index: index, onRemove: () {
              setState(() {
                _productManager.removeFromCartlist(index);
              });
            },);
          },
        );
      },
    );
  }
}
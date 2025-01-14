
import 'package:ecommerce_mobile_ui/features/product/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductSecandCard extends StatelessWidget {
  const ProductSecandCard({super.key,required this.product, required this.onTap,});
  final ProductModel product;
  final Function()?  onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(product.image),
        title: Text(product.title),
        subtitle: Text(product.brandName),
        trailing: Text('\$${product.price}'),
        onTap:onTap
      ),
    );
  }
}

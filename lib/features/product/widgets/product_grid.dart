import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/routes.dart';
import '../model/product_model.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final ProductManager _productManager = ProductManager();
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.productDetailsScreen, arguments: {"index": index});
          },
          child: Hero(
            tag: index,
            child: ProductCard(
              image: products[index].image,
                brandName:"brand",
                title: products[index].title,
                price:products[index].price,
                priceAfetDiscount:products[index].priceAfetDiscount,
                dicountpercent:products[index].dicountpercent,
                press:(){},
              likeOnprees: () {
                _productManager.addToWishlist(products[index]);
               print(  _productManager.getWishProducts());
              },
            ),
          ),
        );
      },
    );
  }
}

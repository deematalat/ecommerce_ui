import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/features/product/widgets/product_secand_card.dart';
import 'package:flutter/material.dart';
import '../../core/routing/routes.dart';
import 'model/product_model.dart';

class ProductSearchScreen extends StatefulWidget {
  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  final ProductManager _productManager = ProductManager();

 late List<ProductModel> filteredProducts ;
   // Default list

  // Method to filter products based on search query
  void _filterProducts(String query) {
    List<ProductModel> tempList = [];
    if (query.isNotEmpty) {
      for (var product in  _productManager.getProducts()) {
        if (product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.brandName.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(product);
        }
      }
    } else {
      tempList =
          _productManager.getProducts(); // Reset to all products if the search field is empty
    }

    setState(() {
      filteredProducts = tempList;
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProducts=_productManager.getProducts();
    _searchController.addListener(() {
      _filterProducts(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search Products'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductSecandCard(
                  product: product,
                  onTap: () {
                    //todo:when click nav to product details screen
                    context.pushNamed(Routes.productDetailsScreen,
                        arguments: {'index': index});
                    // Navigate to product details screen or take any other action
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

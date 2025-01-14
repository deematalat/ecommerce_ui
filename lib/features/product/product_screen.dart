
import 'package:ecommerce_mobile_ui/core/helpers/extensions.dart';
import 'package:ecommerce_mobile_ui/features/product/widgets/product_grid.dart';
import 'package:ecommerce_mobile_ui/features/product/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import 'model/product_model.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<ProductModel> sortedProducts;
  final ProductManager _productManager = ProductManager();
  @override
  void initState() {
    super.initState();
    sortedProducts = _productManager.getProducts(); // Fetch initial products
  }

  void onSortSelected(String sortBy) {
    setState(() {
      sortedProducts = _productManager.sortProducts(sortBy);
    });
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SortBottomSheet(onSortSelected: onSortSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLightGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Woman top"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchScreen);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 40.h,
              colorFilter: ColorFilter.mode(ColorsManager.gray, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: _showSortBottomSheet,
                  child: Text(
                    "Sort By",
                    style: TextStyles.font18blackBold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.twoPaneScreen);
                  },
                  child: Text("Refine", style: TextStyles.font18blackBold),
                )
              ],
            ),
          ),
          Expanded(
            child: ProductGrid(products: sortedProducts),
          ),
        ],
      ),
    );
  }
}

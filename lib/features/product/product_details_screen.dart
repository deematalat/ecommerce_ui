import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/spacing.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/show_snack_bar.dart';
import 'model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = '';
  Color? _selectedColor;
  late bool isEdit=false;
  ProductModel? editingProduct;
  final ProductManager _productManager = ProductManager();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, dynamic>? ?? {};
      isEdit = arguments['isEdit'] ?? false;
      print(arguments['isEdit']);
      editingProduct = arguments['product'];

      if (isEdit && editingProduct != null) {
        // Initialize the selected size and color from the product being edited
        _selectedSize = editingProduct?.selectedSize ?? '';
        _selectedColor = editingProduct?.selectedColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>? ?? {};
    final _index = arguments['index'] ?? 0;
    final productItem = isEdit ? editingProduct! : _productManager.getProducts()[_index];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(productItem.image, _index),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductTitle(productItem),
                  verticalSpace(10),
                  _buildProductPricing(productItem),
                  verticalSpace(10),
                  _buildSizeSelection(),
                  verticalSpace(20),
                  _buildColorSelection(),
                ],
              ),
            ),
            verticalSpace(30),
            _buildActionButton(context, productItem),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('MISS CHASE'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Badge(
            label: Text(_productManager
                .getCartProducts()
                .length
                .toString()),
            child: Icon(Icons.shopping_bag),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage(String image, index) {
    return Hero(
      tag: index,
      child: Image.asset(
        image,
        width: double.infinity,
        height: 500.h,
      ),
    );
  }

  Widget _buildProductTitle(ProductModel productItem) {
    return Text(
      productItem.title,
      style: TextStyles.font18blackBold,
    );
  }

  Widget _buildProductPricing(ProductModel productItem) {
    return Row(
      children: [
        Text("\$${productItem.price.toString()}",
            style: TextStyles.font18blackBold),
        horizontalSpace(8),
        if (productItem.priceAfetDiscount != null)
          Text(
            "\$${productItem.priceAfetDiscount.toString()}",
            style: TextStyles.font18underline,
          ),
        horizontalSpace(8),
        if (productItem.dicountpercent != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            height: 25.h,
            decoration: const BoxDecoration(
              color: ColorsManager.green,
              borderRadius:
              BorderRadius.all(Radius.circular(25)),
            ),
            child: Text(
              "${productItem.dicountpercent}% off",
              style: TextStyles.font18WhiteMedium,
            ),
          ),
      ],
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SELECT SIZE"),
        verticalSpace(10),
        Wrap(
          spacing: 8,
          children: ['S', 'M', 'L', 'XL'].map((size) {
            return Material(
              child: ChoiceChip(
                label: Text(size),
                selected: _selectedSize == size,
                onSelected: (selected) {
                  setState(() {
                    _selectedSize = selected ? size : '';
                  });
                },
                selectedColor: ColorsManager.errorColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }


  Widget _buildColorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SELECT COLOUR"),
        verticalSpace(10),
        Wrap(
          spacing: 8,
          children: [
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.yellow,
          ].map((color) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = color;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_selectedColor == color)
                    CircleAvatar(
                      backgroundColor: color.withOpacity(0.3),
                      radius: 18,
                    ),
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 15,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, ProductModel productItem) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppTextButton(
        onPressed: () {
          if (_selectedSize.isEmpty || _selectedColor == null) {
            showSnackBar(context, "Please select size and color");
            return;
          }

          if (isEdit) {
            // Handle the edit logic (update the product in cart)
            _productManager.updateCartProduct(
              editingProduct!,
              selectedSize: _selectedSize,
              selectedColor: _selectedColor!,
            );
          } else {
            // Handle the add-to-cart logic
            _productManager.addToCartlist(ProductModel(
              title: productItem.title,
              price: productItem.priceAfetDiscount ?? productItem.price,
              priceAfetDiscount: productItem.price,
              description: 'Keep your look lively as you wear this top',
              image: productItem.image,
              dicountpercent: productItem.dicountpercent,
              brandName: 'MISS CHASE',
              selectedColor: _selectedColor!,
              selectedSize: _selectedSize,
            ));
          }

          setState(() {
            Navigator.pop(context);
          });
        },
        buttonText: isEdit ? 'SAVE CHANGES' : 'ADD TO BAG',
        textStyle: TextStyles.font26WhiteBold,
      ),
    );
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/helpers/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final String description;
  final String ? selectedSize;
  final Color ? selectedColor;

  ProductModel(
      {
    required this.description,
    this.selectedSize,
    this.selectedColor,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
  ProductModel copyWith({
    String? title,
    double? price,
    double? priceAfetDiscount,
    String? image,
    int? dicountpercent,
    String? description,
    String? brandName,
    String? selectedSize,
    Color? selectedColor,
  }) {
    return ProductModel(
      title: title ?? this.title,
      price: price ?? this.price,
      priceAfetDiscount: priceAfetDiscount ?? this.priceAfetDiscount,
      image: image ?? this.image,
      dicountpercent: dicountpercent ?? this.dicountpercent,
      description: description ?? this.description,
      brandName: brandName ?? this.brandName,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
class ProductManager {
  // Singleton setup
  static final ProductManager _instance = ProductManager._internal();

  factory ProductManager() => _instance;

  ProductManager._internal();

  final List<ProductModel> _originalProducts =  [
    ProductModel(
      image: productDemoImg1,
      title: "Mountain Warehouse for Women",
      brandName: "Lipsy london",
      price: 540,
      priceAfetDiscount: 420,
      dicountpercent: 20, description: '',
    ),
    ProductModel(
      image: productDemoImg4,
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 800, description: '',
    ),
    ProductModel(
      image: productDemoImg5,
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40, description: '',
    ),
    ProductModel(
      image: productDemoImg6,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5, description: '',
    ),
    ProductModel(
      image: productDemoImg4,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40, description: '',
    ),
    ProductModel(
      image: productDemoImg4,
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5, description: '',
    ),
  ];
  final List<ProductModel> _wishlist = [];
  final List<ProductModel> _cartProductsList = [];
  List<ProductModel> getProducts() {
    return _originalProducts;
  }
  void updateCartProduct(ProductModel product, {required String selectedSize, required Color selectedColor}) {
    final index = _cartProductsList.indexWhere((p) => p == product);
    if (index != -1) {
      _cartProductsList[index] = product.copyWith(
        selectedSize: selectedSize,
        selectedColor: selectedColor,
      );
    }
  }
  List<ProductModel> getWishProducts() {
    return _wishlist;
  }
  List<ProductModel> getCartProducts() {
    return _cartProductsList;
  }
  List<ProductModel> sortProducts(String sortBy) {
    List<ProductModel> sortedList = List.from(_originalProducts);

    switch (sortBy) {
      case "Popularity":
        return demoBestSellersProducts;
      case "Discount":
        sortedList.sort((a, b) => (b.dicountpercent ?? 0).compareTo(a.dicountpercent ?? 0));
        break;
      case "Price:High-Low":
        sortedList.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Price:Low-High":
        sortedList.sort((a, b) => a.price.compareTo(b.price));
        break;
    }

    return sortedList;
  }

  void removeFromCartlist(int index) {
    _cartProductsList.removeAt(index);
  }
  void addToCartlist(ProductModel product) {
    if (!_cartProductsList.contains(product)) {
      _cartProductsList.add(product);
    }
}

  void removeFromWishlist(int index) {
    _wishlist.removeAt(index);
  }
  void addToWishlist(ProductModel product) {
    if (!_wishlist.contains(product)) {
      _wishlist.add(product);
    }
  }
}

List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: productDemoImg4,
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40, description: '',
  ),
  ProductModel(
    image: productDemoImg4,
    title: "white satin corset top",
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5, description: '',
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15, description: '',
  ),
];



class BrandOffer {
  final String title;
  final String discount;
  final String imagePath;

  BrandOffer({required this.title, required this.discount, required this.imagePath});
}

final List<BrandOffer> brandOffers = [
  BrandOffer(title: "Rain & Rainbow", discount: "Minimum 50% Off", imagePath: 'assets/images/brands/brand1.png'),
  BrandOffer(title: "Men’s Brand Day", discount: "Flat 55% Off", imagePath: 'assets/images/brands/brand1.png'),
  BrandOffer(title: "Rouse", discount: "Minimum 40% Off", imagePath: 'assets/images/brands/brand1.png'),
];
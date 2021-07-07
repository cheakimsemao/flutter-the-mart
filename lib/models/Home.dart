import 'package:the_mart/models/Product.dart';

class Home {
  List<String> carouselImages;
  List<Product> recommendationProducts;
  List<Product> bestSellingProducts;

  Home(
    this.carouselImages,
    this.recommendationProducts,
    this.bestSellingProducts,
  );

  Home.fromJson(Map<String, dynamic> json) {
    List<dynamic> carouselImagesData = json['carouselImages'];
    carouselImages = carouselImagesData.map((e) => e as String).toList();

    List<dynamic> recommendationProductsData = json['recommendationProducts'];
    recommendationProducts = recommendationProductsData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> bestSellingProductsData = json['bestSellingProducts'];
    bestSellingProducts = bestSellingProductsData.map((e) => Product.fromJson(e)).toList();
  }
}

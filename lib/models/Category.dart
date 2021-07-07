import 'Product.dart';

class Category {
  List<Product> productName;
  List<Product> productImage;
  List<Product> productCategory;
  List<Product> productDescription;
  List<Product> productPirce;

  Category(
    this.productName,
    this.productImage,
    this.productCategory,
    this.productDescription,
    this.productPirce,
  );

  Category.fromJson(Map<String, dynamic> json) {
    List<dynamic> productNameData = json['productName'];
    productName = productNameData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> productImageData = json['productImage'];
    productImage = productImageData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> productCategoryData = json['productCategoryData'];
    productCategory = productCategoryData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> productDescriptionData = json['productDescription'];
    productDescription = productDescriptionData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> productPirceData = json['productPirce'];
    productPirce = productPirceData.map((e) => Product.fromJson(e)).toList();    
  }
}
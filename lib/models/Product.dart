class Product {
  int id;
  String productName;
  String productImage;
  String productCategory;
  String productDescription;
  String productPrice;

  Product(
    this.id,
    this.productName,
    this.productImage,
    this.productCategory,
    this.productDescription,
    this.productPrice,
  );

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      productName = json['productName'],
      productImage = json['productImage'],
      productCategory = json['productCategory'],
      productDescription = json['productDescription'],
      productPrice = json['productPrice'];
}

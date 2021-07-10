import 'package:the_mart/models/Category.dart';
import 'package:the_mart/models/Product.dart';

class ProductList {
  List<Category> categoryList;
  List<Product> candies;
  List<Product> drinks;
  List<Product> fruits;
  List<Product> noodles;
  List<Product> snacks;

  ProductList(
    this.categoryList,
    this.candies,
    this.drinks,
    this.fruits,
    this.noodles,
    this.snacks,
  );

  ProductList.fromJson(Map<String, dynamic> json) {
    List<dynamic> categoryListData = json['categoryList'];
    categoryList = categoryListData.map((e) => Category.fromJson(e)).toList();

    List<dynamic> candiesData = json['candies'];
    candies = candiesData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> drinksData = json['drinks'];
    drinks = drinksData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> fruitsData = json['fruits'];
    fruits = fruitsData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> noodlesData = json['noodles'];
    noodles = noodlesData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> snacksData = json['snacks'];
    snacks = snacksData.map((e) => Product.fromJson(e)).toList();    
  }
}
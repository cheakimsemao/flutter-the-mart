import 'dart:convert';
import 'package:http/http.dart';
import 'package:the_mart/models/ProductList.dart';
import 'package:the_mart/models/Home.dart';

class DataProvider {
  static Future<Home> fetchHomeData() async {
    final url = Uri.parse('http://localhost:3000/home');
    final response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseObject = jsonDecode(response.body);
      return Home.fromJson(responseObject);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<ProductList> fetchProductListData() async {
    final url = Uri.parse('http://localhost:3000/categories');
    final response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseObject = jsonDecode(response.body);
      return ProductList.fromJson(responseObject);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

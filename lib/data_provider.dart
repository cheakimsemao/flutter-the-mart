import 'dart:convert';
import 'package:http/http.dart';
import 'package:the_mart/models/ProductList.dart';
import 'package:the_mart/models/Home.dart';
import 'package:the_mart/models/Review.dart';

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

  static Future<List<Review>> fetchReviewsData(int productId) async {
    final url = Uri.parse('http://localhost:3000/reviews?productId=$productId');
    final response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> responseList = jsonDecode(response.body);
      return responseList.map((e) {
        Map<String, dynamic> reviewObject = e;
        return Review.fromMap(reviewObject);
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Review> addReview(int productId, double rating, String comment, String reviewer, String reviewerProfile) async {
    final url = Uri.parse('http://localhost:3000/reviews');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final newReview = Review(0, productId, reviewer, reviewerProfile, rating, comment, DateTime.now().millisecondsSinceEpoch);
    final response = await post(url, headers: headers, body: newReview.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return newReview;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/write_review/components/write_review_body.dart';

class WriteReviewScreen extends StatelessWidget {
  static String routeName = '/write_review';

  final Product product;

  WriteReviewScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: WriteReviewBody(product),
    );
  }
}
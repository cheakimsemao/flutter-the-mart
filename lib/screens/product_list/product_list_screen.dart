import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/models/Category.dart';
import 'package:the_mart/screens/product_list/components/product_list_body.dart';

class ProductListScreen extends StatefulWidget {
  static String routeName = '/product_list';

  final String categoryName;
  
  ProductListScreen(this.categoryName);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: ProductListBody(widget.categoryName),
    );
  }
}

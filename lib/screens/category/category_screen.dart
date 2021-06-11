import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/screens/category/components/category_body.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: CategoryBody(),
    );
  }
}
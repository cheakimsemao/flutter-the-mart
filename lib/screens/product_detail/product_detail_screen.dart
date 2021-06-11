import 'package:flutter/material.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/product_detail/components/product_detail_body.dart';
import 'package:the_mart/size_config.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(12)
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            iconSize: 35,
            color: Color(0xFF757575),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(12)
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              iconSize: 35,
              color: Color(0xFF757575),
              onPressed: () {},
            ),
          )
        ],
        toolbarHeight: 60,
      ),
      body: ProductDetailBody(product: arguments.product),
    );
  }
}

class ProductDetailArguments {
  final Product product;

  ProductDetailArguments({ this.product });
}

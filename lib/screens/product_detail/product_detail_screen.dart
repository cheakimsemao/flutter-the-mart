import 'package:flutter/material.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/product_detail/components/product_detail_body.dart';
import 'package:the_mart/size_config.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/product_detail';
  
  final Product product;
  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // final ProductDetailArguments arguments = ModalRoute.of(context).settings.arguments;

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
              icon: Icon(Icons.share_rounded),
              iconSize: 30,
              color: Color(0xFF757575),
              onPressed: () {},
            ),
          )
        ],
        toolbarHeight: 60,
      ),
      body: ProductDetailBody(widget.product),
    );
  }
}

// class ProductDetailArguments {
//   final Product product;

//   ProductDetailArguments({ this.product });
// }

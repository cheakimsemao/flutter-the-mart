import 'package:flutter/material.dart';
import 'package:the_mart/components/product_card.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/size_config.dart';

class SuggestedForYou extends StatelessWidget {
  const SuggestedForYou({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(230),
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(20),
        bottom: getProportionateScreenWidth(20),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ...List.generate(products.length, (index) {
            if (products[index].isRecommendation) {
              return ProductCard(product: products[index]);
            }
            return SizedBox.shrink();
          }),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }
}

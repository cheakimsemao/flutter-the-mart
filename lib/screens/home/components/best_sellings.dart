import 'package:flutter/material.dart';
import 'package:the_mart/components/product_card.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/product_detail/product_detail_screen.dart';
import 'package:the_mart/size_config.dart';

class BestSellings extends StatelessWidget {
  const BestSellings({
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
            if (products[index].isBestSellings) {
              return ProductCard(
                product: products[index],
                press: () => Navigator.pushNamed(
                  context,
                  ProductDetailScreen.routeName,
                  arguments: ProductDetailArguments(
                    product: products[index]
                  ),
                )
              );
            }
            return SizedBox.shrink();
          }),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }
}

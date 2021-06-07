import 'package:flutter/material.dart';
import 'package:the_mart/components/item_card.dart';
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
          ItemCard(
            itemImage: 'assets/images/drinks/drinks-1.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$1.00',
          ),
          ItemCard(
            itemImage: 'assets/images/snacks/pringles-1.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$2.00',
          ),
          ItemCard(
            itemImage: 'assets/images/drinks/drinks-7.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$1.00',
          ),
          ItemCard(
            itemImage: 'assets/images/candies/candies-6.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$1.00',
          ),
          ItemCard(
            itemImage: 'assets/images/noodles/noodles-2.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$3.00',
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }
}

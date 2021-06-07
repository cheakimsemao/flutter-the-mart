import 'package:flutter/material.dart';
import 'package:the_mart/components/item_card.dart';
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
          ItemCard(
            itemImage: 'assets/images/snacks/kitkat-1.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$2.00',
          ),
          ItemCard(
            itemImage: 'assets/images/noodles/noodles-3.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$3.00',
          ),
          ItemCard(
            itemImage: 'assets/images/noodles/noodles-1.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$3.00',
          ),
          ItemCard(
            itemImage: 'assets/images/fruits/fruits-2.jpg',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$1.50',
          ),
          ItemCard(
            itemImage: 'assets/images/drinks/water-1.png',
            itemName: 'Lorem Ipsum',
            itemPrice: '\$1.00',
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }
}

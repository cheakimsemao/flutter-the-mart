import 'package:flutter/material.dart';
import 'package:the_mart/components/item_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25),
        vertical: getProportionateScreenWidth(12)
      ),
      child: Column(
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(
              bottom: getProportionateScreenWidth(30)
            ),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(32),
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            ),
          ),
          ItemCard(
            icon: 'assets/icons/candy.svg',
            text: 'Candies',
          ),
          ItemCard(
            icon: 'assets/icons/drinks.svg',
            text: 'Drinks',
          ),
          ItemCard(
            icon: 'assets/icons/fruits.svg',
            text: 'Fruits',
          ),
          ItemCard(
            icon: 'assets/icons/noodle.svg',
            text: 'Noodles',
          ),
          ItemCard(
            icon: 'assets/icons/snack.svg',
            text: 'Snacks',
          ),
        ]
      ),
    );
  }
}

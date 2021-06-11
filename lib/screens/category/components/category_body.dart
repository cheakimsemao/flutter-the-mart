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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(25)
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  color: primaryColor
                ),
              ),
            )
          ),
          ItemCard(
            icon: 'assets/icons/candy.svg',
            category: 'Candies',
          ),
          ItemCard(
            icon: 'assets/icons/drinks.svg',
            category: 'Drinks',
          ),
          ItemCard(
            icon: 'assets/icons/fruits.svg',
            category: 'Fruits',
          ),
          ItemCard(
            icon: 'assets/icons/noodle.svg',
            category: 'Noodles',
          ),
          ItemCard(
            icon: 'assets/icons/snack.svg',
            category: 'Snacks',
          ),
        ]
      ),
    );
  }
}

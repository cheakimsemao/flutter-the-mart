import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class HomeOfferTitle extends StatelessWidget {
  const HomeOfferTitle({
    Key key,
    this.title,

  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(5),
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: primaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
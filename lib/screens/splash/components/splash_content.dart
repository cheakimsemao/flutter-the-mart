import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'The Mart',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(40),
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(285),
          width: getProportionateScreenWidth(255),
        ),
      ],
    );
  }
}
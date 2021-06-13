import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(68),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenWidth(15)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: secondaryColor.withOpacity(0.25)
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 0),
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(15)
            ),
            child: SvgPicture.asset(
              icon,
              width: getProportionateScreenWidth(22),
              height: getProportionateScreenWidth(22),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14)
            ),
          )
        ],
      ),
    );
  }
}

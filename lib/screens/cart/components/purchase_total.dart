import 'package:flutter/material.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class PurchaseTotal extends StatelessWidget {
  const PurchaseTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175,
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(20)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: secondaryColor.withOpacity(0.25)
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, -5),
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
              vertical: getProportionateScreenWidth(5)
            ),
            padding: EdgeInsets.only(
              bottom: getProportionateScreenWidth(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '\$100.00',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          DefaultButton(
            text: 'Check Out',
            press: () {}
          )
        ],
      ),
    );
  }
}

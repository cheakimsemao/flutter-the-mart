import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class CartCounter extends StatefulWidget {
  CartCounter({Key key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfProduct = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(35)
      ),
      child: Row(
        children: <Widget>[
          buildOutlineButton(
            icon: Icons.remove,
            press: () {
              if (numOfProduct > 1) {
                setState(() {
                  numOfProduct--;
                });
              }
            }
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10)
            ),
            child: Text(
              numOfProduct.toString().padLeft(2, '0'),
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
          ),
          buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfProduct++;
              });
            }
          ),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton({ IconData icon, Function press }) {
    return SizedBox(
      width: getProportionateScreenWidth(35),
      height: getProportionateScreenWidth(30),
      // ignore: deprecated_member_use
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: secondaryColor,
        ),
      )
    );
  }
}

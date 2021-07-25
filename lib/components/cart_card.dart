import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key key,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productAmount,
  }) : super(key: key);

  final String productImage;
  final String productName;
  final String productPrice;
  final int productAmount;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(110),
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25),
        vertical: getProportionateScreenWidth(5),
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
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: Row(
          children: [
            Image.network(
              widget.productImage,
              width: getProportionateScreenWidth(110),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: getProportionateScreenWidth(5)),
                Text.rich(
                  TextSpan(
                    text: '\$${widget.productPrice}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.bold,
                      color: primaryColor
                    ),
                    children: [
                      TextSpan(
                        text: ' x${widget.productAmount}',
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(10)
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.clear_outlined)
              )
            )
          ]
        ),
      ),
    );
  }
}

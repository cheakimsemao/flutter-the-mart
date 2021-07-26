import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_mart/components/cart_counter.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/review/review_screen.dart';
import 'package:the_mart/size_config.dart';

class ProductDetailBody extends StatefulWidget {
  final Product product;

  ProductDetailBody(this.product);

  @override
  _ProductDetailBodyState createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: getProportionateScreenWidth(240),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(widget.product.productImage),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenWidth(20)
            ),
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(20)
            ),
            width: double.infinity,
            height: 522,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35),
                    vertical: getProportionateScreenWidth(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.product.productName,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                        ),
                      ),
                      Text(
                        '\$${widget.product.productPrice}',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(30)
                  ),
                  child: RatingBarIndicator(
                    rating: 4.5,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 22,
                    itemPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(1)
                    ),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: primaryLightColor,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)
                  ),
                  child: Text(
                    widget.product.productDescription,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14)
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Category: ',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: primaryColor,
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                            vertical: getProportionateScreenWidth(2)
                          ),
                          child: Text(
                            widget.product.productCategory,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                            )
                          ),
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: getProportionateScreenWidth(30)),
                CartCounter(),
                SizedBox(height: getProportionateScreenWidth(30)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenWidth(56),
                        padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReviewScreen(widget.product)),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            side: BorderSide(
                              width: 0.8,
                              color: primaryLightColor,
                            ),
                            primary: secondaryColor,
                          ),
                          child: Icon(
                            Icons.rate_review,
                            color: primaryColor,
                            size: getProportionateScreenWidth(25),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(228),
                        height: getProportionateScreenHeight(56),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          color: primaryColor,
                          onPressed: () {},
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.white,
                            ),
                          )
                        ),
                      )
                    ]
                  ),
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}

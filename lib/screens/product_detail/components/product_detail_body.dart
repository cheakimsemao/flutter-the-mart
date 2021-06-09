import 'package:flutter/material.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/size_config.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({
    Key key,
    this.product
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: getProportionateScreenWidth(240),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(product.productImage),
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
                      product.productName,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                      ),
                    ),
                    Text(
                      '\$${product.productPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)
                ),
                child: Text(
                  product.productDescription,
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
                          product.productCategory,
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
              SizedBox(height: getProportionateScreenWidth(50)),
              Align(
                alignment: Alignment.center,
                child: DefaultButton(
                  text: 'Add to Cart',
                  press: () {},
                ),
              )
            ],
          ),
        )
      ]
    );
  }
}

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
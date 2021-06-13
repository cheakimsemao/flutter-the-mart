import 'package:flutter/material.dart';
import 'package:the_mart/components/cart_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/cart/components/purchase_total.dart';
import 'package:the_mart/size_config.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(25),
            ),
            margin: EdgeInsets.only(
              bottom: getProportionateScreenWidth(10)
            ),
            alignment: Alignment.center,
            child: Text(
              'Your Cart',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(32),
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(15)
                ),
                child: Column(
                  children: <Widget>[
                    CartCard(
                      productImage: 'assets/images/noodles/noodles-2.jpg',
                      productName: 'Lorem Ipsum',
                      productPrice: '\$2.00',
                      productAmount: ' x4',
                    ),
                    CartCard(
                      productImage: 'assets/images/drinks/drinks-2.jpg',
                      productName: 'Lorem Ipsum',
                      productPrice: '\$2.00',
                      productAmount: ' x2',
                    ),
                    CartCard(
                      productImage: 'assets/images/fruits/fruits-2.jpg',
                      productName: 'Lorem Ipsum',
                      productPrice: '\$2.00',
                      productAmount: ' x1',
                    ),
                    CartCard(
                      productImage: 'assets/images/candies/candies-1.jpg',
                      productName: 'Lorem Ipsum',
                      productPrice: '\$2.00',
                      productAmount: ' x2',
                    ),
                    CartCard(
                      productImage: 'assets/images/snacks/lays-1.jpg',
                      productName: 'Lorem Ipsum',
                      productPrice: '\$2.00',
                      productAmount: ' x2',
                    ),
                  ],
                ),
              ),
            ),
          ),
          PurchaseTotal(),
        ],
      ),
    );
  }
}

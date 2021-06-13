import 'package:flutter/material.dart';
import 'package:the_mart/screens/cart/components/cart_body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartBody(),
    );
  }
}

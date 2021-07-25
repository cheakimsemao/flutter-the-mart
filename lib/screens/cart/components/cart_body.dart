import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:the_mart/components/cart_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/models/Cart.dart';
import 'package:the_mart/screens/cart/components/purchase_total.dart';
import 'package:the_mart/size_config.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List<Cart> fetchCart = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<Cart> fetchCartData() async {
    final url = Uri.parse('https://cheakimse-the-mart-api.herokuapp.com/cart');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchCart.add(Cart.fromJson(i));
        }
        _isLoading = false;
      });
    } else {
      _isError = true;
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: getProportionateScreenWidth(45),
              color: errorColor
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              'Error while loading data from the server. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: errorColor,
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      );
    }

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
            child: ListView.builder(
              itemCount: fetchCart.length,
              itemBuilder: (context, i) {
                return CartCard(
                  productImage: fetchCart[i].productImage,
                  productName: fetchCart[i].productName,
                  productPrice: fetchCart[i].productPrice,
                  productAmount: fetchCart[i].productAmount,
                );
              }
            ),
          ),
          PurchaseTotal(),
        ],
      ),
    );
  }
}

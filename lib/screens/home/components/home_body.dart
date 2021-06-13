import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/home/components/best_sellings.dart';
import 'package:the_mart/screens/home/components/home_carousel.dart';
import 'package:the_mart/screens/home/components/suggested_for_you.dart';
import 'package:the_mart/screens/home/components/home_offer_title.dart';
import 'package:the_mart/screens/home/components/home_search.dart';
import 'package:the_mart/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            'The Mart',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          HomeSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  HomeCarousel(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  HomeOfferTitle(title: 'Suggested For You'),
                  SuggestedForYou(),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  HomeOfferTitle(title: 'Best Sellings'),
                  BestSellings(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

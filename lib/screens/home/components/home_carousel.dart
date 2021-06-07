import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class HomeCarousel extends StatefulWidget {
  HomeCarousel({Key key}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  final List<String> imageList = [
    'assets/images/carousel-fruits.jpg',
    'assets/images/carousel-snacks.jpg',
    'assets/images/carousel-drinks.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16/9,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              // autoPlay: true,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 3),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
            items: imageList.map((item) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                )
              ),
            )).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getProportionateScreenWidth(7)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.map((path) {
              int index = imageList.indexOf(path);
              return Container(
                width: _current == index ? 20 : 8,
                height: 8,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: _current == index ? primaryColor : Color(0xFFD8D8D8),
                ),
              );
            }).toList(),     
          ),
        )
      ]
    );
  }
}

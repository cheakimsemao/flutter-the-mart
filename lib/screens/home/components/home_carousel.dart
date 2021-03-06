import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> imageList;

  HomeCarousel(this.imageList);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.imageList.isEmpty ? SizedBox.shrink(): Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(7)
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: Offset(0, 7),
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
            items: widget.imageList.map((item) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover,
                )
              ),
            )).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageList.map((path) {
            int index = widget.imageList.indexOf(path);
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
        )
      ]
    );
  }
}

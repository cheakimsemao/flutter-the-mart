import 'package:flutter/material.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/screens/splash/components/splash_content.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class Body extends StatefulWidget {
  // Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to The Mart, let\'s shop!\n',
      'image': 'assets/images/splash-1.png',
    },
    {
      'text': 'You can find all items that you \nwant here',
      'image': 'assets/images/splash-2.png',
    },
    {
      'text': 'You can purchase your items \nwith only serveral clicks',
      'image': 'assets/images/splash-3.png',
    },
    {
      'text': 'We will deliver your items within \n24 hours',
      'image': 'assets/images/splash-4.png',
    }
  ];

  int currentPage = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  image: splashData[index]['image'],
                ),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index)
                      )
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: currentPage == splashData.length - 1 ? 'Continue' : 'Next',
                      press: () {
                        if (currentPage == splashData.length - 1) {}
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/screens/onboarding/components/onboarding_content.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/sign_in/sign_in_screen.dart';
import 'package:the_mart/size_config.dart';

class OnboardingBody extends StatefulWidget {
  OnboardingBody({Key key}) : super(key: key);

  @override
  _OnboardingBodyState createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  List<Map<String, String>> onboardingData = [
    {
      'text': 'Welcome to The Mart, let\'s shop!\n',
      'image': 'assets/images/onboarding-1.png',
    },
    {
      'text': 'You can find all items that you \nwant here',
      'image': 'assets/images/onboarding-2.png',
    },
    {
      'text': 'You can purchase your items \nwith only several clicks',
      'image': 'assets/images/onboarding-3.png',
    },
    {
      'text': 'We will deliver your items within \n24 hours',
      'image': 'assets/images/onboarding-4.png',
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
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
        ),
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
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingContent(
                    text: onboardingData[index]['text'],
                    image: onboardingData[index]['image'],
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
                          onboardingData.length,
                          (index) => buildDot(index: index)
                        )
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: currentPage == onboardingData.length - 1 ? 'Continue' : 'Next',
                        press: () {
                          if (currentPage == onboardingData.length - 1) {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          }
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
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
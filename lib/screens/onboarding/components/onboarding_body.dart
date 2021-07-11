import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/models/Onboarding.dart';
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
  int currentPage = 0;
  PageController _controller;
  List<Onboarding> fetchOnboarding = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<Onboarding> fetchOnboardingData() async {
    final url = Uri.parse('http://localhost:3000/onboarding');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchOnboarding.add(Onboarding.fromJson(i));
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
    _controller = PageController(initialPage: 0);
    super.initState();
    fetchOnboardingData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  itemCount: fetchOnboarding.length,
                  itemBuilder: (context, i) => OnboardingContent(
                    text: fetchOnboarding[i].text,
                    image: fetchOnboarding[i].image,
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
                          fetchOnboarding.length,
                          (index) => buildDot(index: index)
                        )
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: currentPage == fetchOnboarding.length - 1 ? 'Continue' : 'Next',
                        press: () {
                          if (currentPage == fetchOnboarding.length - 1) {
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
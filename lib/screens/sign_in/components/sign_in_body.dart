import 'package:flutter/material.dart';
import 'package:the_mart/components/no_account_text.dart';
import 'package:the_mart/components/social_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/sign_in/components/sign_in_form.dart';
import 'package:the_mart/size_config.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                'Sign In',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: getProportionateScreenWidth(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Let\'s get started!',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignInForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialCard(
                    icon: "assets/icons/google.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText()
              ],
            ),
          ),
        ),
      )
    );
  }
}

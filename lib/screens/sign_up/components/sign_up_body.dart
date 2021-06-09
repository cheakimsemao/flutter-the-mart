import 'package:flutter/material.dart';
import 'package:the_mart/components/or_divider.dart';
import 'package:the_mart/components/social_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/sign_in/sign_in_screen.dart';
import 'package:the_mart/screens/sign_up/components/sign_up_form.dart';
import 'package:the_mart/size_config.dart';

class SignUpBody extends StatelessWidget {
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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: getProportionateScreenWidth(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Create your free account here',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              OrDivider(),
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
              SizedBox(height: SizeConfig.screenHeight * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14)
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context, SignInScreen.routeName
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              )
              ],
            ),
          ),
        ),
      )
    );
  }
}
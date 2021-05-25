import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/complete_profile/components/complete_profile_form.dart';
import 'package:the_mart/size_config.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({Key key}) : super(key: key);

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
                'Complete Profile',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: getProportionateScreenWidth(34),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Complete your details',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:the_mart/components/no_account_text.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/reset_password/components/reset_password_form.dart';
import 'package:the_mart/size_config.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key key}) : super(key: key);

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
                'Reset Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: getProportionateScreenWidth(36),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Enter your email and we will send you\na link to reset your password',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPasswordForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.005),
              NoAccountText()
              ],
            ),
          ),
        ),
      )
    );
  }
}
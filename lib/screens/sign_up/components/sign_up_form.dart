import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/complete_profile/complete_profile_screen.dart';
import 'package:the_mart/size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildConfirmPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: 'Continue',
              press: () {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
            )
          ],
        ),
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(26),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/lock.svg',
            height: getProportionateScreenWidth(22),
          ),
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Enter your confirm password',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(26),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/lock.svg',
            height: getProportionateScreenWidth(22),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/mail.svg',
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
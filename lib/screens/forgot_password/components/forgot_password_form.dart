import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  ForgotPasswordForm({Key key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            SizedBox(height: getProportionateScreenHeight(20)),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: 'Reset Password',
              press: () {},
            )
          ],
        ),
      )
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
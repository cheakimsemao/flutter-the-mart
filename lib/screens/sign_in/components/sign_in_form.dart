import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/main/main_screen.dart';
import 'package:the_mart/screens/reset_password/reset_password_screen.dart';
import 'package:the_mart/size_config.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: <Widget>[
                Checkbox(
                  value: isRemember,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      isRemember = value;
                    });
                  },
                ),
                Text('Remember me'),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName
                  ),
                  child: Text('Forgot Password')
                ),
              ]
            ),
            // FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: 'Sign In',
              press: () {
                Navigator.pushNamed(
                  context, MainScreen.routeName
                );
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

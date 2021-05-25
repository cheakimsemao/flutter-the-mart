import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/sign_up/sign_up_screen.dart';
import 'package:the_mart/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14)
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context, SignUpScreen.routeName
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/screens/sign_up/components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: SignUpBody(),
    );
  }
}
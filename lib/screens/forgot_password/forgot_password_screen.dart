import 'package:flutter/material.dart';
import 'package:the_mart/screens/forgot_password/components/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = './forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ForgotPasswordBody(),
    );
  }
}
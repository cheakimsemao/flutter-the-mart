import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/screens/reset_password/components/reset_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = './reset_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: ForgotPasswordBody(),
    );
  }
}
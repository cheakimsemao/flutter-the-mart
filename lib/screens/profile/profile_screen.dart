import 'package:flutter/material.dart';
import 'package:the_mart/screens/profile/components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}

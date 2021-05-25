import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/screens/complete_profile/components/complete_profile_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: CompleteProfileBody(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:the_mart/screens/onboarding/components/onboarding_body.dart';
import 'package:the_mart/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: OnboardingBody(),
    );
  }
}

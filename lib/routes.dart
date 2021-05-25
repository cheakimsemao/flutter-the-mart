import 'package:flutter/material.dart';
import 'package:the_mart/screens/forgot_password/forgot_password_screen.dart';
import 'package:the_mart/screens/onboarding/onboarding_screen.dart';
import 'package:the_mart/screens/sign_in/sign_in_screen.dart';
import 'package:the_mart/screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
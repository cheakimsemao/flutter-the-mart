import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFB326);
const primaryLightColor = Color(0xFFFFCE75);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFC340), Color(0xFFFFB326)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);
const errorColor = Color(0xFFCF0000);

const animationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email";
const String invalidEmailError = "Please enter valid email";
const String passwordNullError = "Please enter your password";
const String shortPasswordError = "Password is too short";
const String matchPasswordError = "Passwords don't match";

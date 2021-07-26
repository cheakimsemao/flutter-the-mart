import 'package:flutter/material.dart';
import 'package:the_mart/screens/cart/cart_screen.dart';
import 'package:the_mart/screens/category/category_screen.dart';
import 'package:the_mart/screens/home/home_screen.dart';
import 'package:the_mart/screens/main/main_screen.dart';
import 'package:the_mart/screens/notification/notification_screen.dart';
import 'package:the_mart/screens/product_detail/product_detail_screen.dart';
import 'package:the_mart/screens/product_list/product_list_screen.dart';
import 'package:the_mart/screens/profile/profile_screen.dart';
import 'package:the_mart/screens/reset_password/reset_password_screen.dart';
import 'package:the_mart/screens/onboarding/onboarding_screen.dart';
import 'package:the_mart/screens/review/review_screen.dart';
import 'package:the_mart/screens/sign_in/sign_in_screen.dart';
import 'package:the_mart/screens/sign_up/sign_up_screen.dart';
import 'package:the_mart/screens/write_review/write_review_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  // ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  // ProductListScreen.routeName: (context) => ProductListScreen(),
  // ReviewScreen.routeName: (context) => ReviewScreen(),
  // WriteReviewScreen.routeName: (context) => WriteReviewScreen(),
};

import 'package:flutter/material.dart';
import 'package:the_mart/routes.dart';
import 'package:the_mart/screens/home/home_screen.dart';
import 'package:the_mart/screens/onboarding/onboarding_screen.dart';
import 'package:the_mart/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Mart',
      theme: theme(),
      home: HomeScreen(),
      initialRoute: OnboardingScreen.routeName,
      routes: routes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_mart/screens/notification/components/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: backAppBar(),
      body: NotificationBody(),
    );
  }
}
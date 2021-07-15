import 'package:flutter/material.dart';
import 'package:the_mart/components/back_appbar.dart';
import 'package:the_mart/screens/write_review/components/write_review_body.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({Key key}) : super(key: key);

  static String routeName = '/write_review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(),
      body: WriteReviewBody(),
    );
  }
}
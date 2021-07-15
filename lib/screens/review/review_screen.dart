import 'package:flutter/material.dart';
import 'package:the_mart/screens/review/components/review_body.dart';
import 'package:the_mart/screens/write_review/write_review_screen.dart';
import 'package:the_mart/size_config.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key key}) : super(key: key);

  static String routeName = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(12)
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            iconSize: 35,
            color: Color(0xFF757575),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(12)
            ),
            child: IconButton(
              icon: Icon(Icons.add_comment_outlined),
              iconSize: 30,
              color: Color(0xFF757575),
              onPressed: () {
                Navigator.pushNamed(
                  context, WriteReviewScreen.routeName
                );
              }
            ),
          )
        ],
        toolbarHeight: 60,
      ),
      body: ReviewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class WriteReviewBody extends StatefulWidget {
  WriteReviewBody({Key key}) : super(key: key);

  @override
  _WriteReviewBodyState createState() => _WriteReviewBodyState();
}

class _WriteReviewBodyState extends State<WriteReviewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30)
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: getProportionateScreenWidth(30)
            ),
            alignment: Alignment.center,
            child: Text(
              'Write a Review',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(32),
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            children: <Widget>[
              SizedBox(width: getProportionateScreenWidth(7)),
              Text(
                'Click to Rate:',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15)
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 27,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(1)
                ),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: primaryColor,
            maxLines: 7,
            decoration: InputDecoration(
              labelText: 'Review',
              hintText: 'Enter your experience',
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
          DefaultButton(
            press: () {},
            text: 'Submit',
          ),
        ]
      ),
    );
  }
}

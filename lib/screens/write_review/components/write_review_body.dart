import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/screens/review/review_screen.dart';
import 'package:the_mart/size_config.dart';

class WriteReviewBody extends StatefulWidget {
  final Product product;

  WriteReviewBody(this.product);

  @override
  _WriteReviewBodyState createState() => _WriteReviewBodyState();
}

class _WriteReviewBodyState extends State<WriteReviewBody> {
  final _reviewController = TextEditingController();
  double rating = 0;

  void _onSubmitClick() async {
    await DataProvider.addReview(
      widget.product.id,
      rating,
      _reviewController.text.trim(),
      'Cheakimse Mao',
      'assets/images/profile.png');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReviewScreen(widget.product)));
  }

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
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 27,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(1)
                ),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: primaryLightColor,
                ),
                onRatingUpdate: (value) {
                  rating = value;
                },
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
          TextFormField(
            controller: _reviewController,
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
            press: _onSubmitClick,
            text: 'Submit',
          ),
        ]
      ),
    );
  }
}

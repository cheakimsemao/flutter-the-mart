import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class ReviewBody extends StatefulWidget {
  ReviewBody({Key key}) : super(key: key);

  @override
  _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            bottom: getProportionateScreenWidth(30)
          ),
          alignment: Alignment.center,
          child: Text(
            'Review',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(32),
              fontWeight: FontWeight.bold,
              color: primaryColor
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25)
            ),
            child: ListView(
              children: <Widget>[
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
              ],
            )
          ),
        )
      ]
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenWidth(50),
              margin: EdgeInsets.only(
                right: getProportionateScreenWidth(10)
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.png'
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cheakimse Mao',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                RatingBarIndicator(
                  rating: 4.5,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(1)
                  ),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: primaryLightColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text('15/07/2021')
          ],
        ),
        SizedBox(height: getProportionateScreenWidth(15)),
        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nulla nunc, suscipit non egestas et, tempor quis est.'),
        SizedBox(height: getProportionateScreenWidth(25)),
      ]
    );
  }
}

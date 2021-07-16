import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/models/Review.dart';
import 'package:the_mart/size_config.dart';

class ReviewBody extends StatefulWidget {
  final Product product;

  ReviewBody(this.product);

  @override
  _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  List<Review> _reviews;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();

    DataProvider.fetchReviewsData(widget.product.id).then((value) {
      setState(() {
        _reviews = value;
        _isLoading = false;
      });
    }).catchError((error) {
      print('Error: $error');
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: getProportionateScreenWidth(45),
              color: errorColor
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              'Error while loading data from the server. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: errorColor,
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      );
    }

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
              children: _reviews.map(reviewCard).toList()
            )
          ),
        )
      ]
    );
  }

  Widget reviewCard(Review review) {
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
                backgroundImage: AssetImage(review.reviewerProfile),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  review.reviewer,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                RatingBarIndicator(
                  rating: review.rating,
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
            Text(review.formattedDate()),
          ],
        ),
        SizedBox(height: getProportionateScreenWidth(15)),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(review.comment)
        ),
        SizedBox(height: getProportionateScreenWidth(25)),
      ]
    );
  }
}

// class ReviewCard extends StatefulWidget { 
  

//   @override
//   _ReviewCardState createState() => _ReviewCardState();
// }

// class _ReviewCardState extends State<ReviewCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Container(
//               width: getProportionateScreenWidth(50),
//               height: getProportionateScreenWidth(50),
//               margin: EdgeInsets.only(
//                 right: getProportionateScreenWidth(10)
//               ),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage(
//                   'assets/images/profile.png'
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Cheakimse Mao',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 RatingBarIndicator(
//                   rating: 4.5,
//                   direction: Axis.horizontal,
//                   itemCount: 5,
//                   itemSize: 15,
//                   itemPadding: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(1)
//                   ),
//                   itemBuilder: (context, _) => Icon(
//                     Icons.star,
//                     color: primaryLightColor,
//                   ),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Text('15/07/2021')
//           ],
//         ),
//         SizedBox(height: getProportionateScreenWidth(15)),
//         Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nulla nunc, suscipit non egestas et, tempor quis est.'),
//         SizedBox(height: getProportionateScreenWidth(25)),
//       ]
//     );
//   }
// }

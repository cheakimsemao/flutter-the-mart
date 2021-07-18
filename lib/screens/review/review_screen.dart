import 'package:flutter/material.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/models/Review.dart';
import 'package:the_mart/screens/review/components/review_body.dart';
import 'package:the_mart/screens/write_review/write_review_screen.dart';
import 'package:the_mart/size_config.dart';

class ReviewScreen extends StatefulWidget {
  static String routeName = '/review';

  final Product product;

  ReviewScreen(this.product);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<Review> _reviews;

  @override
  void initState() {
    super.initState();

    DataProvider.fetchReviewsData(widget.product.id).then((value) {
      setState(() {
        _reviews = value;
      });
    });
  }

  void _onAddReviewClick() async {
    final route = MaterialPageRoute<Review>(
        builder: (context) => WriteReviewScreen(widget.product));
    final result = await Navigator.pushReplacement(context, route);
    if (result != null) {
      setState(() {
        _reviews.add(result);
      });
    }
  }

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
              onPressed: _onAddReviewClick,
            ),
          )
        ],
        toolbarHeight: 60,
      ),
      body: ReviewBody(widget.product),
    );
  }
}

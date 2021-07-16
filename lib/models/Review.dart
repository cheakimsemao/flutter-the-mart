import 'dart:convert';

import 'package:intl/intl.dart';

class Review {
  int id;
  int productId;
  String reviewer;
  String reviewerProfile;
  double rating;
  String comment;
  int datetime;

  Review(
    this.id,
    this.productId,
    this.reviewer,
    this.reviewerProfile,
    this.rating,
    this.comment,
    this.datetime
  );

  String formattedDate() {
    final reviewDate = DateTime.fromMillisecondsSinceEpoch(datetime);
    final formatter = DateFormat.yMd();
    return formatter.format(reviewDate);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'reviewer': reviewer,
      'reviewerProfile': reviewerProfile,
      'rating': rating,
      'comment': comment,
      'datetime': datetime,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      map['id'],
      map['productId'],
      map['reviewer'],
      map['reviewerProfile'],
      double.parse(map['rating'].toString()),
      map['comment'],
      map['datetime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));
}

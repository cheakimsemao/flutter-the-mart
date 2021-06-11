import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,
    this.notification
  }) : super(key: key);

  final String notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: getProportionateScreenWidth(68)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10)
      ),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenWidth(15)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: secondaryColor.withOpacity(0.25)
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 0),
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(15)
            ),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: getProportionateScreenWidth(20),
              height: getProportionateScreenWidth(20),
            ),
          ),
          Flexible(
            child: Text(
              notification,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12)
              ),
            ),
          )
        ],
      ),
    );
  }
}

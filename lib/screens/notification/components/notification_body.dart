import 'package:flutter/material.dart';
import 'package:the_mart/components/notification_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
          vertical: getProportionateScreenWidth(12)
        ),
        margin: EdgeInsets.only(
          top: getProportionateScreenWidth(60)
        ),
        child: Column(
          children: <Widget> [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(5),
                  bottom: getProportionateScreenWidth(25)
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenWidth(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(3)
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              )
            ),
            NotificationCard(
              notification: 'Thanks for purchasing products from our mart.',
            ),
            NotificationCard(
              notification: 'Purchased successfully! Your products will be delivered to your location in 24 hours.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
            NotificationCard(
              notification: 'Your item has been added to the cart.',
            ),
          ]
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:the_mart/components/notification_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/models/Notifications.dart';
import 'package:the_mart/size_config.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({Key key}) : super(key: key);

  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  List<Notifications> fetchNotification = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<Notifications> fetchNotificationData() async {
    final url = Uri.parse('http://localhost:3000/notifications');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchNotification.add(Notifications.fromJson(i));
        }
        _isLoading = false;
      });
    } else {
      _isError = true;
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNotificationData();
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

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
          vertical: getProportionateScreenWidth(12)
        ),
        margin: EdgeInsets.only(
          top: getProportionateScreenWidth(20)
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(5),
                  bottom: getProportionateScreenWidth(25)
                ),
                margin: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(10)
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
                )
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fetchNotification.length,
                itemBuilder: (context, i) {
                  return NotificationCard(
                    notificationDescription: fetchNotification[i].notificationDescription,
                  );
                }
              ),
            ),
          ]
        ),
      ),
    );
  }
}

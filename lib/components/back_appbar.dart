import 'package:flutter/material.dart';
import 'package:the_mart/size_config.dart';

AppBar backAppBar() {
  return AppBar(
    leading: Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(10)
      ),
      child: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    ),
    toolbarHeight: 60,
  );
}

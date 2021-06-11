import 'package:flutter/material.dart';
import 'package:the_mart/size_config.dart';

AppBar backAppBar() {
  return AppBar(
    leading: Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(15)
      ),
      child: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 35,
            ),
            iconSize: 30,
            color: Color(0xFF757575),
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

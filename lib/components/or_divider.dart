import 'package:flutter/material.dart';
import 'package:the_mart/size_config.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: Container(
        margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(30)
        ),
        child: Row(
          children: <Widget>[
            buildDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('OR'),
            ),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFF959595),
        height: 2.5,
      )
    );
  }
}
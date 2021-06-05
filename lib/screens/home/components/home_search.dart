import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: getProportionateScreenWidth(12)
            ),
            width: SizeConfig.screenWidth * 0.75,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search Products',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)
                ) 
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.format_list_bulleted_outlined)
            ),
          )
        ],
      ),
    );
  }
}

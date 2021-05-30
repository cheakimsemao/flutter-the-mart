import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    Key key,
    this.bottomNavBarIcons,
    this.index,
    this.activedIndex,
    this.onTabChanged,
  }) : super(key: key); 

  final dynamic bottomNavBarIcons;
  final int index;
  final int activedIndex;
  final ValueChanged<int> onTabChanged;

  void onTap() { onTabChanged(index); }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            bottomNavBarIcons['icon'],
            height: getProportionateScreenWidth(bottomNavBarIcons['height']),
            color: activedIndex == index ? primaryColor : null,
          ),
          SizedBox(height: 5),
          Text(
            bottomNavBarIcons['title'],
            style: TextStyle(
              color: activedIndex == index ? primaryColor : null
            ),
          ),
        ],
      ),
    );
  }
}

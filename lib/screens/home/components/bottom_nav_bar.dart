import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/home/components/bottom_nav_bar_item.dart';
import 'package:the_mart/size_config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required
    List bottomNavBarIcons, 
    this.activedIndex,
    this.onTabChanged,
  }) : _bottomNavBarIcons = bottomNavBarIcons, super(key: key);

  final List _bottomNavBarIcons;
  final int activedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(20)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: shadowColor.withOpacity(0.15),
            blurRadius: 25,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_bottomNavBarIcons.length, (index) {
          return BottomNavBarItem(
            bottomNavBarIcons: _bottomNavBarIcons[index],
            index: index,
            activedIndex: activedIndex,
            onTabChanged: onTabChanged,
          );
        })
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_mart/screens/home/components/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  static String routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List _bottomNavBarIcons = List.unmodifiable([
    {
      'icon': 'assets/icons/home.svg',
      'title': 'Home',
      'height': 25.0,
    },
    {
      'icon': 'assets/icons/category.svg',
      'title': 'Categories',
      'height': 25.0,
    },
    {
      'icon': 'assets/icons/cart.svg',
      'title': 'Cart',
      'height': 25.0,
    },
    {
      'icon': 'assets/icons/profile.svg',
      'title': 'Profile',
      'height': 25.0,
    },
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    Container(),
    Container(),
    Container(),
    Container(),
  ]);

  int currentTab = 0;

  void onTabChanged(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[currentTab],
      bottomNavigationBar: BottomNavBar(
        bottomNavBarIcons: _bottomNavBarIcons,
        activedIndex: currentTab,
        onTabChanged: onTabChanged,
      )
    );
  }
}

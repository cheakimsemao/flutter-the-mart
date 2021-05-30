import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  static String routeName = '/home_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _screenIndex = 0;

  List<Widget> screenList = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>  
        FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child
        ),
        child: screenList[_screenIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: _screenIndex,
          onTap: (index) {
            setState(() {
              _screenIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 28.0,
              ),
              label: 'Home'
            ), 
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_list_bulleted_outlined,
                size: 28.0,
              ),
              label: 'Categories'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 28.0,
              ),
              label: 'Cart'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 28.0,
              ),
              label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
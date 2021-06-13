import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:the_mart/screens/home/home_screen.dart';
import 'package:the_mart/screens/notification/notification_screen.dart';
import 'package:the_mart/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  static String routeName = '/home_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _screenIndex = 0;

  List<Widget> screenList = <Widget>[
    HomeScreen(),
    Container(),
    NotificationScreen(),
    ProfileScreen(),
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35.0,
              ),
              label: 'Home'
            ), 
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 32.0,
              ),
              label: 'Cart'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
                size: 32.0,
              ),
              label: 'Notification'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 35.0,
              ),
              label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
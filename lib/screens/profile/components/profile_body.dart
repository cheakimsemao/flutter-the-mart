import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_mart/components/item_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/sign_in/sign_in_screen.dart';
import 'package:the_mart/size_config.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
            vertical: getProportionateScreenWidth(25)
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile.png'
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 0,
                        child: Container(
                          height: getProportionateScreenWidth(35),
                          width: getProportionateScreenWidth(35),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                Text(
                  'Cheakimse Mao',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(5)),
                Text(
                  'cmao2@paragoniu.edu.kh',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(11)
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(25)),
                ItemCard(
                  icon: 'assets/icons/user.svg',
                  text: 'My Account',
                  press: () {},
                ),
                ItemCard(
                  icon: 'assets/icons/history.svg',
                  text: 'Purchase History',
                  press: () {},
                ),
                ItemCard(
                  icon: 'assets/icons/settings.svg',
                  text: 'Settings',
                  press: () {},
                ),
                ItemCard(
                  icon: 'assets/icons/question.svg',
                  text: 'Help Center',
                  press: () {},
                ),
                ItemCard(
                  icon: 'assets/icons/logout.svg',
                  text: 'Log Out',
                  press: () {
                    auth.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInScreen())
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/screens/home/home_screen.dart';
import 'package:the_mart/size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            buildUsernameFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: 'Sign Up',
              press: () async {
                if (_formKey.currentState.validate()) {
                  try {
                    FirebaseUser user = (await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,)).user;
                    if (user != null) {
                      UserUpdateInfo updateUser = UserUpdateInfo();
                      updateUser.displayName = _usernameController.text;
                      user.updateProfile(updateUser);
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    }
                  } catch (e) {
                    print(e);
                    return null;
                  }
                }
              },
            )
          ],
        ),
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(26),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/lock.svg',
            height: getProportionateScreenWidth(22),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Please enter more than 6 characters';
        }
        return null;
      },
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.name,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Enter your username',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(26),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: getProportionateScreenWidth(22),
          ),
        ),
      ),
      validator: (value) => value.isEmpty ? 'Please enter your username' : null,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/mail.svg',
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
      validator: (value) => value.isEmpty ? 'Please enter your email' : null,
    );
  }
}
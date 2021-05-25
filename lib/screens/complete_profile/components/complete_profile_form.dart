import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/default_button.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteYourProfileFormState createState() => _CompleteYourProfileFormState();
}

class _CompleteYourProfileFormState extends State<CompleteProfileForm> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(25)),
            buildAddressFormField(),
            SizedBox(height: getProportionateScreenHeight(18)),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12)
                  ),
                  child: Text('By chicking this box you consent to our:')
                ),
              ]
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 18),
                  child: Checkbox(
                    value: isAgree,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isAgree = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of use ',
                          style: TextStyle(
                            color: primaryColor,
                          )
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: primaryColor,
                          )
                        ),
                        TextSpan(
                          text: ', as well as acknowledge reciept of our '
                        ),
                        TextSpan(
                          text: 'Privacy Notice',
                          style: TextStyle(
                            color: primaryColor,
                          )
                        ),
                        TextSpan(text: '.'),
                      ]
                    )
                  ),
                ),
              ]
            ),
            SizedBox(height: getProportionateScreenHeight(18)),
            DefaultButton(
              text: 'Sign Up',
              press: () {},
            )
          ],
        ),
      )
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(18),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: getProportionateScreenWidth(20),
          ),
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(18),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: getProportionateScreenWidth(20),
          ),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/phone.svg',
            height: getProportionateScreenWidth(20),
          ),
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your address',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            'assets/icons/location.svg',
            height: getProportionateScreenWidth(20),
          ),
        ),
      ),
    );
  }
}
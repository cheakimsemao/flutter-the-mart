import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/constants.dart';
import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(
        error: errors[index]
      )),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/error.svg',
          height: getProportionateScreenHeight(18),
          width: getProportionateScreenWidth(18),  
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error, style: TextStyle(color: errorColor)),
      ],
    );
  }
}

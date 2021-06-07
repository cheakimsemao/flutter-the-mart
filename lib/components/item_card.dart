import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/size_config.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.itemImage,
    this.itemName,
    this.itemPrice,
  }) : super(key: key);

  final String itemImage;
  final String itemName;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget> [
        Container(
          width: getProportionateScreenWidth(160),
          // height: 300,
          margin: EdgeInsets.only(
            left: getProportionateScreenWidth(18.5)
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: secondaryColor.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: Offset(0, 0),
              )
            ]
          ),
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, ProductDetailScreen.routeName);
            },
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(100),
                  margin: EdgeInsets.only(
                    top: getProportionateScreenWidth(18), 
                    bottom: getProportionateScreenWidth(10)
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(itemImage)
                    )
                  ),
                ),
                Column(
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12)
                      ),
                    ),
                    Text(
                      itemPrice,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],  
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 15,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(7),
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]
    );
  }
}

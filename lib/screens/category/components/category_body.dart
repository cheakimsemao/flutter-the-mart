import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_mart/components/item_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Category.dart';
import 'package:the_mart/models/ProductList.dart';
import 'package:the_mart/screens/product_list/components/product_list_body.dart';
import 'package:the_mart/screens/product_list/product_list_screen.dart';
import 'package:the_mart/size_config.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({Key key}) : super(key: key);

  @override
  _CategoryBodyState createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  ProductList _productList;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();

    DataProvider.fetchProductListData().then((value) {
      setState(() {
        _productList = value;
        _isLoading = false;
      });
    }).catchError((error) {
      print('Error: $error');
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenHeight(250)
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: getProportionateScreenWidth(45),
              color: errorColor
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              'Error while loading data from the server. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: errorColor,
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
          vertical: getProportionateScreenWidth(12)
        ),
        child: Column(
          children: <Widget>[
            categoryWidget(),
          ]
        ),
      ),
    );
  }

  Widget categoryWidget() {
    final categoryTitle = Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenWidth(30)
      ),
      child: Text(
        'Categories',
        style: TextStyle(
          fontSize: getProportionateScreenWidth(32),
          fontWeight: FontWeight.bold,
          color: primaryColor
        ),
      ),
    );

    final categoryList = categoryListView();

    return Column(children: [categoryTitle, categoryList]);
  }

  Widget categoryListView() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenHeight(250)
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: getProportionateScreenWidth(45),
              color: errorColor
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              'Error while loading data from the server. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: errorColor,
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      );
    }

    final categories = _productList.categoryList;

    return Column(
      children: categories.map((e) {
        return categoryItemWidget(e);
      }).toList(),
    );
  }

  Widget categoryItemWidget(Category category) {
    return GestureDetector(
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) => ProductListScreen(category.categoryName)
        );
        Navigator.of(context).push(route);
      },
      child: Container(
        width: double.infinity,
        height: getProportionateScreenWidth(68),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)
        ),
        margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(15)
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: secondaryColor.withOpacity(0.25)
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: Offset(0, 0),
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(15)
              ),
              child: SvgPicture.asset(
                category.categoryIcon,
                width: getProportionateScreenWidth(22),
                height: getProportionateScreenWidth(22),
              ),
            ),
            Text(
              category.categoryName,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      ),
    );
  }
}

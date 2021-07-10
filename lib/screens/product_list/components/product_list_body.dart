import 'package:flutter/material.dart';
import 'package:the_mart/components/product_card.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Category.dart';
import 'package:the_mart/models/Product.dart';
import 'package:the_mart/models/ProductList.dart';
import 'package:the_mart/screens/product_detail/product_detail_screen.dart';
import 'package:the_mart/size_config.dart';

class ProductListBody extends StatefulWidget {
  final String categoryName;

  ProductListBody(this.categoryName);

  @override
  _ProductListBodyState createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
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
          horizontal: getProportionateScreenWidth(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

    return Column(
      children: <Widget>[
        Expanded(
          child: productListWidget(category: widget.categoryName.toString())
        ),
      ],
    );
  }

  Widget productListWidget({ String category }) {
    final categoryTitle = Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenWidth(30)
      ),
      child: Text(
        widget.categoryName.toString(),
        style: TextStyle(
          fontSize: getProportionateScreenWidth(32),
          fontWeight: FontWeight.bold,
          color: primaryColor
        ),
      ),
    );

    final productList = productListView(category: widget.categoryName.toString());

    return Column(children: [categoryTitle, productList]);
  }

  Widget productListView({ String category }) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

    var categories;

    if (category == 'Candies') {
      categories = _productList.candies;
    } else if (category == 'Drinks') {
      categories = _productList.drinks;
    } else if (category == 'Fruits') {
      categories = _productList.fruits;
    } else if (category == 'Noodles') {
      categories = _productList.noodles;
    } else if (category == 'Snacks') {
      categories = _productList.snacks;
    }

    return Expanded(
      child: Container(
        height: getProportionateScreenWidth(230),
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(20)
        ),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: (158 / 170),
          children: categories.map<Widget>((e) {
            return productItemWidget(e);
          }).toList(),
        ),
      ),
    );
  }

  Widget productItemWidget(Product product) {
    return GestureDetector( 
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product)
        );
        Navigator.of(context).push(route);
      },
      child: Stack(
        children: <Widget> [
          Container(
            width: getProportionateScreenWidth(160),
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(18.5),
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
                      image: AssetImage(product.productImage)
                    )
                  ),
                ),
                Column(
                  children: [
                    Text(
                      product.productName,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12)
                      ),
                    ),
                    Text(
                      '\$${product.productPrice}',
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
      ),
    );
  }
}
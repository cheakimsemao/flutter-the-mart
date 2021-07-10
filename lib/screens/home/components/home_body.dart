import 'package:flutter/material.dart';
import 'package:the_mart/constants.dart';
import 'package:the_mart/data_provider.dart';
import 'package:the_mart/models/Home.dart';
import 'package:the_mart/models/Product.dart';
// import 'package:the_mart/screens/home/components/best_sellings.dart';
import 'package:the_mart/screens/home/components/home_carousel.dart';
// import 'package:the_mart/screens/home/components/suggested_for_you.dart';
import 'package:the_mart/screens/home/components/home_offer_title.dart';
import 'package:the_mart/screens/home/components/home_search.dart';
import 'package:the_mart/screens/product_detail/product_detail_screen.dart';
import 'package:the_mart/size_config.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Home _home;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();

    DataProvider.fetchHomeData().then((value) {
      setState(() {
        _home = value;
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

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Text(
            'The Mart',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          HomeSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeCarousel(_isLoading == true ? [] : _home.carouselImages),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  // SuggestedForYou(),
                  productsWidget(),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  productsWidget(isBestSellings: true),
                  // BestSellings(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }

  Widget productsWidget({ bool isBestSellings = false }) {
    final offerTitle = HomeOfferTitle(
      title: isBestSellings ? 'Best Sellings' : 'Suggested For You'
    );
    final productsList = productsListView(isBestSellings: isBestSellings);
    return Column(children: [offerTitle, productsList]);
  }

  Widget productsListView({ bool isBestSellings = false }) {
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
    
    final products = isBestSellings ? _home.bestSellingProducts : _home.recommendationProducts;

    return Container(
      height: getProportionateScreenWidth(230),
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(20),
        bottom: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20)
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products.map((e) {
          return productItemWidget(e);
        }).toList(),
      )
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
            width: getProportionateScreenWidth(158),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smoothie_app_ui/screens/purchase_screen.dart';
import 'package:smoothie_app_ui/widgets/animated_texts.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  ValueNotifier<double> paddingImage = ValueNotifier<double>(120);
  ValueNotifier<double> buyNowHeight = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    productImage();
  }

  //* Change product image position
  productImage() async {
    paddingImage.value = 120;
    await Future.delayed(const Duration(milliseconds: 100), () {
      paddingImage.value = 0;
      setState(() {
        buyNowHeight.value = 60;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);
    final animation2 = Provider.of<Animation<double>>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //* White background animation -----------------------------------------------------------
          AnimatedBuilder(
            animation: animation2,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -1),
                  end: Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation2,
                    curve: Interval(
                      0.6,
                      1,
                      curve: Curves.easeOutCubic,
                    ),
                  ),
                ),
                child: child,
              );
            },
            child: Container(
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          //* Background image animation ---------------------------------------------------------
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -1),
                  end: Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Interval(
                      0.5,
                      1,
                      curve: Curves.easeOutCubic,
                    ),
                  ),
                ),
                child: child,
              );
            },
            child: Stack(
              children: [
                //* background image
                Container(
                  height: 500,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      'lib/assets/strawberry-background.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //* Background gradient
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black45,
                        Colors.black26,
                        Colors.black26,
                        Colors.black45,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                //* Topic text
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 100),
                  child: AnimatedTexts(
                    child: Text(
                      'Strawberry\nSmoothie',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    delay: 800,
                  ),
                ),
                //* Description Text
                Center(
                  child: Container(
                    width: 250,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 200),
                    child: AnimatedTexts(
                      child: Text(
                        'Strawberry-flavored juice and real strawberry pieces shaken with ice.',
                        style: TextStyle(
                          fontFamily: 'sf',
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      delay: 900,
                    ),
                  ),
                )
              ],
            ),
          ),
          //* Product white card
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Hero(
              tag: 'mainCard',
              child: Container(
                height: 323,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black54,
                      offset: new Offset(0.0, 5.0),
                      blurRadius: 40.0,
                      spreadRadius: -12,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //* Product image
                    ValueListenableBuilder<double>(
                      valueListenable: paddingImage,
                      builder:
                          (BuildContext context, double value, Widget child) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          padding: EdgeInsets.only(left: value, top: 20),
                          child: Image.asset(
                            'lib/assets/product-3.png',
                            height: 230,
                          ),
                        );
                      },
                    ),
                    //* Buy now button
                    ValueListenableBuilder<double>(
                      valueListenable: buyNowHeight,
                      builder:
                          (BuildContext context, double value, Widget child) {
                        return AnimatedContainer(
                          height: value,
                          duration: Duration(milliseconds: 600),
                          width: double.infinity,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return ListenableProvider(
                                      create: (context) => animation,
                                      child: PurchaseScreen(),
                                    );
                                  },
                                  transitionDuration: Duration(seconds: 1),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.grey,
                              backgroundColor: Color(0xffb00015),
                              elevation: 0,
                            ),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                fontFamily: 'sf',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

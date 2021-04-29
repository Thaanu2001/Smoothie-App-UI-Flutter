import 'package:flutter/material.dart';
import 'package:smoothie_app_ui/services/customicons_icons.dart';
import 'package:smoothie_app_ui/services/scroll_glow_disabler.dart';
import 'package:smoothie_app_ui/widgets/animated_texts.dart';
import 'package:smoothie_app_ui/widgets/carousel_slider.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool appearWidgets = false;
  //* Background Color list
  List<List<Color>> colorList = [
    [
      Color(0x88ccffdd),
      Color(0x55ccffdd),
      Color(0xeeffffff),
      Colors.white,
      // Color(0xcce8fff0),
      // Color(0xfff5fff8),
    ],
    [
      Color(0x66d8a6ff),
      Color(0x55d8a6ff),
      Color(0xeeffffff),
      Colors.white,
      // Color(0xfff6ebff),
      // Color(0xccfaf5ff),
    ],
    [
      Color(0x66ffabab),
      Color(0x44ffabab),
      Color(0xeeffffff),
      Colors.white,
    ]
  ];

  List<Color> whiteGradient = [
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
    appearAnimation();
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }

  appearAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      appearWidgets = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: carouselIndex,
        builder: (BuildContext context, int value, Widget child) {
          return Stack(
            children: [
              //* Background Image
              Container(
                color: Colors.white,
                height: double.infinity,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: (!appearWidgets) ? 0 : 0.20,
                  child: Image.asset(
                    'lib/assets/background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //* Gradient
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                alignment: Alignment.topLeft,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: (!appearWidgets) ? whiteGradient : colorList[value],
                  ),
                ),
                //* Header
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: (!appearWidgets) ? 0 : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //* Topic
                            Text(
                              'Fresh Smoothie Store',
                              style: TextStyle(
                                fontFamily: 'sf',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            //* Add to basket icon
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black26,
                                      offset: new Offset(3.0, 3.0),
                                      blurRadius: 8.0,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Customicons.shopping_basket,
                                  size: 20,
                                ))
                          ],
                        ),
                      ),
                      //* Carousel Slider
                      Flexible(
                        child: CarouselSlider(),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedTexts(
                // delay: 200,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 410, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Topic
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Text(
                          ' Select your smoothie',
                          style: TextStyle(
                            fontFamily: 'sf',
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Flexible(
                        child: ScrollGlowDisabler(
                          child: ListView(
                            padding: EdgeInsets.only(bottom: 8),
                            children: [
                              //* Product 1
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                                padding:
                                    const EdgeInsets.fromLTRB(26, 15, 15, 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[400],
                                      offset: new Offset(3.0, 3.0),
                                      blurRadius: 20.0,
                                      spreadRadius: -10,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    //* product image
                                    Image.asset(
                                      'lib/assets/product-thumbnail-1.png',
                                      height: 70,
                                    ),
                                    SizedBox(width: 8),
                                    //* product details
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Banana and Mango Smoothie',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Rs. 580.00',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //* favourite icon
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Customicons.heart,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              //* product 2
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                                padding:
                                    const EdgeInsets.fromLTRB(26, 15, 15, 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[400],
                                      offset: new Offset(3.0, 3.0),
                                      blurRadius: 20.0,
                                      spreadRadius: -10,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    //* product image
                                    Image.asset(
                                      'lib/assets/product-thumbnail-2.png',
                                      height: 70,
                                    ),
                                    SizedBox(width: 8),
                                    //* product details
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Banana and Mango Smoothie',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Rs. 580.00',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //* favourite icon
                                    Container(
                                      // margin: EdgeInsets.fromLTRB(0, 10, 2, 10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Customicons.heart,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              //* product 3
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                                padding:
                                    const EdgeInsets.fromLTRB(26, 15, 15, 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[400],
                                      offset: new Offset(3.0, 3.0),
                                      blurRadius: 20.0,
                                      spreadRadius: -10,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    //* product image
                                    Image.asset(
                                      'lib/assets/product-thumbnail-3.png',
                                      height: 70,
                                    ),
                                    SizedBox(width: 8),
                                    //* product details
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Banana and Mango Smoothie',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Rs. 580.00',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //* favourite icon
                                    Container(
                                      // margin: EdgeInsets.fromLTRB(0, 10, 2, 10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Customicons.heart,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                                padding:
                                    const EdgeInsets.fromLTRB(26, 15, 15, 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[400],
                                      offset: new Offset(3.0, 3.0),
                                      blurRadius: 20.0,
                                      spreadRadius: -10,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    //* product image
                                    Image.asset(
                                      'lib/assets/product-thumbnail-1.png',
                                      height: 70,
                                    ),
                                    SizedBox(width: 8),
                                    //* product details
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Banana and Mango Smoothie',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Rs. 580.00',
                                            style: TextStyle(
                                              fontFamily: 'sf',
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //* favourite icon
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Customicons.heart,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

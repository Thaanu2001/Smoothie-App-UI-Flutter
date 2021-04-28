import 'package:flutter/material.dart';
import 'package:smoothie_app_ui/widgets/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                height: double.infinity,
                child: Opacity(
                  opacity: 0.20,
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
                    colors: colorList[value],
                  ),
                ),
                //* Header
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
                            'Select your smoothie',
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
                            child: Image.asset(
                              'lib/assets/icons/shopping-basket.png',
                              height: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    //* Carousel Slider
                    Flexible(
                      child: CarouselSlider(),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smoothie_app_ui/screens/product_details_screen.dart';
import 'package:smoothie_app_ui/services/scroll_glow_disabler.dart';

ValueNotifier<int> carouselIndex = ValueNotifier<int>(0);

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  PageController controller;

  int currentpage = 0;
  List<Color> colors = [Colors.green[200], Colors.blue[200], Colors.red[200]];
  double textOpacity = 1;

  @override
  initState() {
    super.initState();
    textOpacity = 1;
    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.85,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      alignment: Alignment.topCenter,
      child: ScrollGlowDisabler(
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
              carouselIndex.value = value;
            },
            controller: controller,
            itemBuilder: (context, index) => cardBuilder(index)),
      ),
    );
  }

  cardBuilder(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .2)).clamp(0.0, 1.0);
        }
        return Container(
          // height: 120,
          // color: Colors.red,
          child: Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 300,
              width: Curves.easeOut.transform(value) * 500,
              child: child,
            ),
          ),
        );
      },
      child: (index == 0)
          ? Container(
              width: 600,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.green[200],
                    offset: new Offset(3.0, 3.0),
                    blurRadius: 20.0,
                    spreadRadius: -10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          //* Product Topic
                          Text(
                            'Kiwi & Mint Smoothie',
                            style: TextStyle(
                              fontFamily: 'sf',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 15),
                          //* Product Dexcription
                          Container(
                            width: 140,
                            child: Text(
                              'Kiwi & mint-flavored juice and real kiwi fruit pieces shaken with ice.',
                              style: TextStyle(
                                fontFamily: 'sf',
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 37),
                          //* Product Price
                          Text(
                            'Rs. 680.00',
                            style: TextStyle(
                              fontFamily: 'sf',
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          //* Buy Now Button
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.green[300],
                                  offset: new Offset(1.5, 1.5),
                                  blurRadius: 8.0,
                                  spreadRadius: -4,
                                )
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                primary: Colors.grey,
                                backgroundColor: Color(0xff04b56e),
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
                          )
                        ],
                      ),
                      //* Product Image
                      Container(
                        padding: EdgeInsets.only(left: 94, top: 10),
                        child: Image.asset(
                          'lib/assets/product-1.png',
                          height: 220,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          : (index == 1)
              ?
              //* Product 2 -----------------------------------------------------------------------------------------
              Container(
                  width: 600,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.purple[200],
                        offset: new Offset(3.0, 3.0),
                        blurRadius: 20.0,
                        spreadRadius: -10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              //* Product Topic
                              Text(
                                'Mix-Berry Smoothie',
                                style: TextStyle(
                                  fontFamily: 'sf',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 15),
                              //* Product Description
                              Container(
                                width: 140,
                                child: Text(
                                  'Mix-berry flavored juice and real blueberry pieces shaken with ice.',
                                  style: TextStyle(
                                    fontFamily: 'sf',
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 34),
                              //* Product Price
                              Text(
                                'Rs. 740.00',
                                style: TextStyle(
                                  fontFamily: 'sf',
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              //* Buy Now button
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.purple[200],
                                      offset: new Offset(1.5, 1.5),
                                      blurRadius: 8.0,
                                      spreadRadius: -4,
                                    )
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    primary: Colors.grey,
                                    backgroundColor: Color(0xff6100ab),
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
                              )
                            ],
                          ),
                          //* Product Image
                          Container(
                            padding: EdgeInsets.only(left: 94, top: 20),
                            child: Image.asset(
                              'lib/assets/product-2.png',
                              height: 193,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : (index == 2)
                  ?
                  //* Product 3 -----------------------------------------------------------------------------------------
                  Hero(
                      tag: 'mainCard',
                      child: Container(
                        width: 600,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.red[200],
                              offset: new Offset(3.0, 3.0),
                              blurRadius: 20.0,
                              spreadRadius: -10,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedOpacity(
                                  opacity: textOpacity,
                                  duration: Duration(milliseconds: 60),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      //* Product Topic
                                      Text(
                                        'Strawberry Smoothie',
                                        style: TextStyle(
                                          fontFamily: 'sf',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      //* Product Description
                                      Container(
                                        width: 140,
                                        child: Text(
                                          'Strawberry-flavored juice and real strawberry pieces shaken with ice.',
                                          style: TextStyle(
                                            fontFamily: 'sf',
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 34),
                                      //* Product Price
                                      Text(
                                        'Rs. 580.00',
                                        style: TextStyle(
                                          fontFamily: 'sf',
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      //* Buy now button
                                      Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.red[200],
                                              offset: new Offset(1.5, 1.5),
                                              blurRadius: 8.0,
                                              spreadRadius: -4,
                                            )
                                          ],
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              textOpacity = 0;
                                            });
                                            await Future.delayed(
                                                const Duration(
                                                    milliseconds: 60),
                                                () {});
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                    animation,
                                                    secondaryAnimation) {
                                                  return ListenableProvider(
                                                    create: (context) =>
                                                        animation,
                                                    child:
                                                        ProductDetailsScreen(),
                                                  );
                                                },
                                                transitionDuration:
                                                    Duration(seconds: 1),
                                              ),
                                            );
                                            setState(() {
                                              textOpacity = 1;
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.fromLTRB(
                                                12, 5, 12, 5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                      )
                                    ],
                                  ),
                                ),
                                //* Product Image
                                Container(
                                  padding: EdgeInsets.only(left: 105, top: 20),
                                  // child: Hero(
                                  // tag: 'productImage',
                                  child: Image.asset(
                                    'lib/assets/product-3.png',
                                    height: 210,
                                    // ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  :
                  //* Product 4 -----------------------------------------------------------------------------------------
                  Container(
                      width: 600,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.yellow[200],
                            offset: new Offset(3.0, 3.0),
                            blurRadius: 20.0,
                            spreadRadius: -10,
                          )
                        ],
                      ),
                    ),
    );
  }

  List<Widget> carouselWidgets = [
    //* Product 1 -----------------------------------------------------------------------------------------
    Container(
      width: 600,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
            color: Colors.green[200],
            offset: new Offset(3.0, 3.0),
            blurRadius: 20.0,
            spreadRadius: -10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  //* Product Topic
                  Text(
                    'Kiwi & Mint Smoothie',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  //* Product Dexcription
                  Container(
                    width: 140,
                    child: Text(
                      'Kiwi & mint-flavored juice and real kiwi fruit pieces shaken with ice.',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 37),
                  //* Product Price
                  Text(
                    'Rs. 680.00',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  //* Buy Now Button
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.green[300],
                          offset: new Offset(1.5, 1.5),
                          blurRadius: 8.0,
                          spreadRadius: -4,
                        )
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.grey,
                        backgroundColor: Color(0xff04b56e),
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
                  )
                ],
              ),
              //* Product Image
              Container(
                padding: EdgeInsets.only(left: 94, top: 10),
                child: Image.asset(
                  'lib/assets/product-1.png',
                  height: 220,
                ),
              )
            ],
          )
        ],
      ),
    ),
    //* Product 2 -----------------------------------------------------------------------------------------
    Container(
      width: 600,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
            color: Colors.purple[200],
            offset: new Offset(3.0, 3.0),
            blurRadius: 20.0,
            spreadRadius: -10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  //* Product Topic
                  Text(
                    'Mix-Berry Smoothie',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  //* Product Description
                  Container(
                    width: 140,
                    child: Text(
                      'Mix-berry flavored juice and real blueberry pieces shaken with ice.',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  //* Product Price
                  Text(
                    'Rs. 740.00',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  //* Buy Now button
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.purple[200],
                          offset: new Offset(1.5, 1.5),
                          blurRadius: 8.0,
                          spreadRadius: -4,
                        )
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.grey,
                        backgroundColor: Color(0xff6100ab),
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
                  )
                ],
              ),
              //* Product Image
              Container(
                padding: EdgeInsets.only(left: 94, top: 20),
                child: Image.asset(
                  'lib/assets/product-2.png',
                  height: 193,
                ),
              )
            ],
          )
        ],
      ),
    ),
    //* Product 3 -----------------------------------------------------------------------------------------
    Container(
      width: 600,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
            color: Colors.red[200],
            offset: new Offset(3.0, 3.0),
            blurRadius: 20.0,
            spreadRadius: -10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  //* Product Topic
                  Text(
                    'Strawberry Smoothie',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  //* Product Description
                  Container(
                    width: 140,
                    child: Text(
                      'Strawberry-flavored juice and real strawberry pieces shaken with ice.',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  //* Product Price
                  Text(
                    'Rs. 580.00',
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  //* Buy now button
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red[200],
                          offset: new Offset(1.5, 1.5),
                          blurRadius: 8.0,
                          spreadRadius: -4,
                        )
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
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
                  )
                ],
              ),
              //* Product Image
              Container(
                padding: EdgeInsets.only(left: 105, top: 20),
                child: Image.asset(
                  'lib/assets/product-3.png',
                  height: 210,
                ),
              )
            ],
          )
        ],
      ),
    ),
    //* Product 4 -----------------------------------------------------------------------------------------
    Container(
      width: 600,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
            color: Colors.yellow[200],
            offset: new Offset(3.0, 3.0),
            blurRadius: 20.0,
            spreadRadius: -10,
          )
        ],
      ),
    ),
  ];
}

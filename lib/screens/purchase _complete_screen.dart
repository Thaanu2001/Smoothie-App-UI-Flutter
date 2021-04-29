import 'package:flutter/material.dart';
import 'package:smoothie_app_ui/services/customicons_icons.dart';
import 'package:smoothie_app_ui/widgets/animated_texts.dart';

class PurchaseCompleteScreen extends StatefulWidget {
  @override
  _PurchaseCompleteScreenState createState() => _PurchaseCompleteScreenState();
}

class _PurchaseCompleteScreenState extends State<PurchaseCompleteScreen> {
  double buttonWidth;
  double buttonHeight;
  double buttonBottomMargin;
  bool buttonAnimationStart = false;
  bool shapeAnimationStart = false;
  @override
  void initState() {
    super.initState();
    buttonTransition();
  }

  buttonTransition() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      buttonWidth = MediaQuery.of(context).size.width;
      buttonHeight = MediaQuery.of(context).size.height;
      buttonBottomMargin = 0;
      buttonAnimationStart = true;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {});
    setState(() {
      shapeAnimationStart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //*
          Container(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              width: (buttonWidth != null)
                  ? buttonWidth
                  : MediaQuery.of(context).size.width - 120,
              height: (buttonHeight != null) ? buttonHeight : 38,
              duration: Duration(milliseconds: 200),
              // padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              margin: EdgeInsets.only(
                  bottom:
                      (buttonBottomMargin != null) ? buttonBottomMargin : 58),
              decoration: BoxDecoration(
                borderRadius: (buttonAnimationStart)
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(10),
                color: Color(0xffb00015),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: (shapeAnimationStart)
                      ? MediaQuery.of(context).size.height
                      : 0,
                  height: (shapeAnimationStart)
                      ? MediaQuery.of(context).size.height
                      : 0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: (shapeAnimationStart)
                        ? BorderRadius.circular(0)
                        : BorderRadius.circular(1000),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            child: AnimatedTexts(
                              delay: 500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //* product image
                                      Image.asset(
                                        'lib/assets/product-3.png',
                                        height: 110,
                                      ),
                                      SizedBox(width: 12),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Banana and Mango Smoothie',
                                              style: TextStyle(
                                                fontFamily: 'sf',
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Rs. 580.00',
                                              style: TextStyle(
                                                fontFamily: 'sf',
                                                fontSize: 20,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.8,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedTexts(
                          delay: 700,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Stack(
                                children: [
                                  Image.asset('lib/assets/map-image.png'),
                                  Container(
                                    width: double.infinity,
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      height: 118,
                                      margin: EdgeInsets.zero,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          minimumSize: Size(60, 25),
                                          padding:
                                              EdgeInsets.fromLTRB(12, 0, 12, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          primary: Colors.grey,
                                          backgroundColor: Colors.black,
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                            fontFamily: 'sf',
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Estimated Arrival',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '20-25 min',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.8,
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        AnimatedTexts(
                          delay: 800,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Your Order',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'add item',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffb00015),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Banana and Mango Smoothie',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Rs. 580.00',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Rs. 80.00',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Rs. 660.00',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.8,
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        AnimatedTexts(
                          delay: 900,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              TextField(
                                minLines: 2,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Add Note',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Customicons.visa,
                                      color: Colors.blue[900]),
                                  SizedBox(width: 10),
                                  Text(
                                    '●●●●    ●●●●    ●●●●',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '  6754',
                                    style: TextStyle(
                                      fontFamily: 'sf',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Colors.black54,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        AnimatedTexts(
                          delay: 1000,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                                'Place Order',
                                style: TextStyle(
                                  fontFamily: 'sf',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

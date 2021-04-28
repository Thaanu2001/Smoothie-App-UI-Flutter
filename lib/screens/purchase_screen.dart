import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
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
                  // child: ,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

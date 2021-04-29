import 'package:flutter/material.dart';
import 'package:smoothie_app_ui/screens/home_screen.dart';

paymentProcessingModal(context) {
  double processOpacity = 1;
  double doneOpacity = 0;
  bool doneAppear = false;
  bool mainContainerAnimation = false;

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          //* Animation process
          animation() async {
            await Future.delayed(const Duration(seconds: 2), () {});
            setState(() {
              processOpacity = 0;
            });
            await Future.delayed(const Duration(milliseconds: 200), () {});
            setState(() {
              doneOpacity = 1;
              doneAppear = true;
            });
            await Future.delayed(const Duration(seconds: 1), () {});
            setState(() {
              mainContainerAnimation = true;
            });
            await Future.delayed(const Duration(milliseconds: 200), () {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => HomeScreen(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          }

          animation();
          //* Modal UI
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: (!mainContainerAnimation)
                ? 200
                : MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
                color: (!mainContainerAnimation)
                    ? Color(0xffb00015)
                    : Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                // animation() async {
                //   await Future.delayed(const Duration(seconds: 2), () {});
                //   setState(() {
                //     processOpacity = 0;
                //   });
                //   await Future.delayed(
                //       const Duration(milliseconds: 200), () {});
                //   setState(() {
                //     doneOpacity = 1;
                //     doneAppear = true;
                //   });
                //   await Future.delayed(const Duration(seconds: 1), () {});
                // }
                //animation();
                return Stack(
                  children: [
                    //* Processing section
                    Container(
                      padding: EdgeInsets.only(top: 75),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: processOpacity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                                strokeWidth: 5,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Processing',
                              style: TextStyle(
                                fontFamily: 'sf',
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Done section
                    Container(
                      padding: EdgeInsets.only(top: 75),
                      child: Stack(
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 100),
                            opacity: (!doneAppear) ? 0 : 1,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              padding: EdgeInsets.only(
                                  left: (!doneAppear)
                                      ? MediaQuery.of(context).size.width * 0.5
                                      : MediaQuery.of(context).size.width *
                                              0.5 -
                                          50),
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.done_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 100),
                            opacity: doneOpacity,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10,
                                  left:
                                      MediaQuery.of(context).size.width * 0.5),
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  fontFamily: 'sf',
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      );
    },
  );
}

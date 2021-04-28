import 'package:flutter/material.dart';

class ScrollGlowDisabler extends StatelessWidget {
  final Widget child;
  ScrollGlowDisabler({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertIuranSafeBeranda extends StatelessWidget {
  const AlertIuranSafeBeranda({
    Key? key,
    this.isDue = false,
  }) : super(key: key);

  final bool isDue;
  @override
  Widget build(BuildContext context) {
    return // Icon Money and Card
        Positioned(
      right: 0,
      bottom: 33.w,
      child: (isDue)
          ? SizedBox(
              width: 73.w,
              height: 63.w,
              child: Image.asset("assets/images/money_green.png"),
            )
          : SizedBox(
              width: 73.w,
              height: 63.w,
              child: Image.asset("assets/images/money_red.png"),
            ),
    );
  }
}

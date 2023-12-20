import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertIuranWarningBeranda extends StatelessWidget {
  const AlertIuranWarningBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 195.w,
      bottom: 60.w,
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(width: 1.5.w, color: Colors.red)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/ic_alert_triangle.png",
              height: 15.w,
            ),
            2.verticalSpace,
          ],
        ),
      ),
    );
  }
}

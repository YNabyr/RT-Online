import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      bottom: 33.h,
      child: (isDue)
          ? SizedBox(
              width: 73.w,
              height: 63.h,
              child: SvgPicture.asset("assets/fill/green_card.svg"),
            )
          : SizedBox(
              width: 73.w,
              height: 63.h,
              child: SvgPicture.asset("assets/fill/red_card.svg"),
            ),
    );
  }
}

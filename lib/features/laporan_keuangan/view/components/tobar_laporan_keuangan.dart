// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopbarLaporanKeuangan extends StatelessWidget {
  const TopbarLaporanKeuangan({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326.w,
      height: 42.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ic left
          SvgPicture.asset(
            "assets/outline/arrow-ios-left.svg",
            height: 20.h,
          ),

          // text bulan
          GestureDetector(
            onTap: onTap,
            child: Text(
              'Oktober',
              style: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 16.sp,
              ),
            ),
          ),

          // ic right
          SvgPicture.asset(
            "assets/outline/arrow-ios-right.svg",
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

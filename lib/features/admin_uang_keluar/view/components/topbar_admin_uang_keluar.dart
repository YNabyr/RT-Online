// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopbarAdminUangKeluar extends StatelessWidget {
  TopbarAdminUangKeluar({
    Key? key,
    this.onTapLeft,
    this.onTapRight,
    this.onTapIcCalendar,
    this.text,
    this.isFilter = false,
    required this.tanggal,
  }) : super(key: key);

  final void Function()? onTapLeft;
  final void Function()? onTapRight;
  final void Function()? onTapIcCalendar;
  final String? text;
  final bool? isFilter;

  List tanggal = [];

  @override
  Widget build(BuildContext context) {
    return (isFilter == true)
        ? Container(
            width: 382.w,
            height: 42.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 8,
                  offset: Offset(4, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                // Button Left
                GestureDetector(
                  onTap: onTapLeft,
                  child: SvgPicture.asset(
                    "assets/outline/arrow-ios-left.svg",
                    height: 20.h,
                  ),
                ),

                // Text
                Expanded(
                  child: (text != null)
                      ? Text(
                          textAlign: TextAlign.center,
                          text!,
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        )
                      : const Text("null"),
                ),

                // Button Right
                GestureDetector(
                  onTap: onTapRight,
                  child: SvgPicture.asset(
                    "assets/outline/arrow-ios-right.svg",
                    height: 20.h,
                  ),
                ),
              ],
            ),
          )
        :
        // isFilter = false
        Container(
            width: 382.w,
            height: 64.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 8,
                  offset: Offset(4, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button Left
                GestureDetector(
                  onTap: onTapLeft,
                  child: SvgPicture.asset(
                    "assets/outline/arrow-ios-left.svg",
                    height: 20.h,
                  ),
                ),

                // List Tanggal
                ...tanggal,

                // Button Right
                GestureDetector(
                  onTap: onTapRight,
                  child: SvgPicture.asset(
                    "assets/outline/arrow-ios-right.svg",
                    height: 20.h,
                  ),
                ),

                // Button calendar
                GestureDetector(
                  onTap: onTapIcCalendar,
                  child: SvgPicture.asset(
                    "assets/outline/calendar.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    height: 20.h,
                  ),
                ),
              ],
            ),
          );
  }
}

buildTgl({
  required String text1,
  required String text2,
  bool? onScope,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 84.w,
      decoration: (onScope == false)
          ? null
          : ShapeDecoration(
              color: const Color(0xFF094181),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: NunitoTextStyle.fw600.copyWith(
              color: (onScope == false) ? Colors.black : Colors.white,
              fontSize: 13.sp,
            ),
          ),
          Text(
            text2,
            style: NunitoTextStyle.fw600.copyWith(
              color: (onScope == false) ? Colors.black : Colors.white,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    ),
  );
}

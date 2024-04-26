// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopbarAdminUangMasuk extends StatelessWidget {
  const TopbarAdminUangMasuk({
    Key? key,
    this.onTapLeft,
    this.onTap,
    this.onTapRight,
    this.text,
  }) : super(key: key);

  final void Function()? onTapLeft;
  final void Function()? onTap;
  final void Function()? onTapRight;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 382.w,
        height: 42.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
      ),
    );
  }
}

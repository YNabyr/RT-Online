// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonIuran extends StatelessWidget {
  const ButtonIuran({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: 382.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(4, 3),
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ],
        ),
        child: SizedBox(
          height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              SizedBox(
                width: 30.w,
                child: SvgPicture.asset(
                  "assets/fill/Tertib.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xff6454F0), BlendMode.srcIn),
                ),
              ),

              // Text
              SizedBox(
                width: 278.w - 32.w,
                child: Text(
                  title,
                  style: NunitoTextStyle.fw500.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
              ),

              // Button Icon
              SizedBox(
                  width: 24.w,
                  child:
                      SvgPicture.asset("assets/outline/arrow-ios-right.svg")),
            ],
          ),
        ),
      ),
    );
  }
}

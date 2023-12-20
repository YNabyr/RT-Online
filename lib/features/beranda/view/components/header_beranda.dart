// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBeranda extends StatelessWidget {
  const HeaderBeranda({
    Key? key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String? text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6EE2F5),
            Color(0xFF6454F0),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 18,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),

      // TopBar Tata Tertib
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 382.w,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button Back Icons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20.w,
                      ),
                    ),
                  ),
                ),

                // Text Informasi
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: 40.horizontalSpace,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

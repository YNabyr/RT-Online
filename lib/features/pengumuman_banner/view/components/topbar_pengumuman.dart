// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopBarPengumuman extends StatelessWidget {
  const TopBarPengumuman({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 100.w,
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
            margin: EdgeInsets.only(top: 15.w),
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
                    height: 40.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/images/ic_arrow_ios_left.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Text Informasi
                Text(
                  (title == null) ? 'Profile' : title!,
                  textAlign: TextAlign.center,
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: Colors.white,
                    fontSize: 20.sp,
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

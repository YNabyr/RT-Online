// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class HeaderAdminArea extends StatelessWidget {
  const HeaderAdminArea({
    Key? key,
    this.title,
    this.suffixIcon,
  }) : super(key: key);

  final String? title;
  final String? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 100.h + safePadding(context),
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
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 382.w,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button Back Icons
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(
                        "assets/outline/arrow-ios-left.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                // Text Informasi
                Text(
                  (title == null) ? 'Iuran' : title!,
                  textAlign: TextAlign.center,
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),

                // Icon
                (suffixIcon == null)
                    ? 24.horizontalSpace
                    : Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: SvgPicture.asset(
                              suffixIcon!,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

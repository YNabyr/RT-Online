// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/pengumuman_banner_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PengumumanContentBeranda extends StatelessWidget {
  const PengumumanContentBeranda({
    Key? key,
    this.isPinned = false,
    this.isLast = false,
    this.isViewed,
    required this.image,
    required this.title,
    required this.date,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final bool isPinned;
  final bool isLast;
  final bool? isViewed;
  final String image;

  final String title;
  final String date;

  final String content;
  final VoidCallback onTap;

  void _navigateToDetailPage() {
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToDetailPage,
      child: Container(
        margin: (isLast == false)
            ? EdgeInsets.symmetric(vertical: 7.5.h)
            : EdgeInsets.only(top: 7.5.h, bottom: 15.h),
        width: 358.w,
        height: 116.h,
        decoration: isViewed ?? false
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffEFF0F5),
              )
            : (isLast != true)
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffCDCFDB),
                      ),
                    ),
                  )
                : const BoxDecoration(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header and Pin Icon
              SizedBox(
                width: 334.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // News Title
                    SizedBox(
                      width: 217.w,
                      child: Text(
                        title,
                        style: NunitoTextStyle.fw700.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: const Color(0xFF0B0C0D),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    // Pin Icon for Pinned Content
                    if (isPinned)
                      SvgPicture.asset(
                        "assets/fill/ic_pin.svg",
                        height: 24.h,
                      ),

                    // Expanded to push Text Tanggal to the right
                    const Expanded(child: SizedBox.shrink()),

                    // Date Text
                    Text(
                      date,
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // News Content
              SizedBox(
                width: 334.w,
                height: 54.h,
                child: Text(
                  content,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: NunitoTextStyle.fw300.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                    height: 1.5.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

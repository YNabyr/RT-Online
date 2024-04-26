// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardProfileUndangwarga extends StatelessWidget {
  const CardProfileUndangwarga({
    Key? key,
    this.isEdit = false,
    this.onTap,
    this.image,
  }) : super(key: key);

  final bool? isEdit;
  final void Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          // Profile
          if (isEdit == false) profile() else profileEdit(),
        ],
      ),
    );
  }

  Widget profile() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Container
        Container(
          padding: EdgeInsets.all(8.w),
          width: 150.w,
          height: 150.h,

          // Profile Image
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: (image == null || image == '')
                    ? const NetworkImage(
                        "https://i.pinimg.com/236x/ab/c6/16/abc6166dbac9b4c99f701948dd507a7d.jpg")
                    : NetworkImage(image!),
                fit: BoxFit.cover,
              ),
              shape: const CircleBorder(),
            ),
          ),
        ),

        // Blok
        Positioned(
          bottom: 4.h,
          child: Container(
            width: 54.w,
            height: 26.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: ShapeDecoration(
              color: const Color(0xFF094181),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Center(
              child: Text(
                "C-23",
                style: NunitoTextStyle.fw700.copyWith(
                  color: const Color(0xFFE2DDFE),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileEdit() {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Container
          Container(
            padding: EdgeInsets.all(8.w),
            width: 150.w,
            height: 150.h,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
            ),

            // Profile Image
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: const ShapeDecoration(
                color: Colors.black,
                image: DecorationImage(
                  opacity: 0.5,
                  image: NetworkImage(
                    "https://i.pinimg.com/236x/ab/c6/16/abc6166dbac9b4c99f701948dd507a7d.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                shape: CircleBorder(),
              ),
            ),
          ),

          // Icon camera
          Positioned.fill(
            top: 5.h,
            child: SizedBox(
              width: 25.w,
              height: 25.h,
              child: const ImageIcon(
                AssetImage("assets/images/ic_camera_fill.png"),
                color: Colors.white,
              ),
            ),
          ),

          // Blok
          Positioned(
            bottom: 4.h,
            child: Container(
              width: 54.w,
              height: 26.h,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: ShapeDecoration(
                color: const Color(0xFF094181),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: Center(
                child: Text(
                  "C-23",
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFFE2DDFE),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

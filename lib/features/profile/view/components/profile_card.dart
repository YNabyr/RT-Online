// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/features/profile/controllers/profile_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    this.isEdit = false,
    this.name,
    this.perumahan,
    this.photo,
    this.badge,
    this.onTap,
  }) : super(key: key);

  final bool? isEdit;
  final String? name;
  final String? perumahan;
  final String? photo;
  final String? badge;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(vertical: 20.w),
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

          16.verticalSpace,

          // Nama
          Text(
            name ?? "null",
            style: PoppinsTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 22.sp,
            ),
          ),

          16.verticalSpace,

          // Alamat
          SizedBox(
            width: 330.w,
            child: Text(
              perumahan ?? "null",
              textAlign: TextAlign.center,
              style: NunitoTextStyle.fw400.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),
          ),
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
          height: 150.w,

          // Profile Image
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  photo ??
                      "https://i.pinimg.com/564x/be/6e/ee/be6eee7aa93781bd1baa53aaf7aeaf0d.jpg",
                ),
                fit: BoxFit.cover,
              ),
              shape: const CircleBorder(),
            ),
          ),
        ),

        // Blok
        Positioned(
          bottom: 4.w,
          child: Container(
            width: 54.w,
            height: 26.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: ShapeDecoration(
              color: const Color(0xFF094181),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Center(
              child: Text(
                badge ?? "null",
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
            height: 150.w,

            // Profile Image
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: ShapeDecoration(
                color: Colors.black,
                image: DecorationImage(
                  opacity: 0.5,
                  image: NetworkImage(photo ??
                      "https://i.pinimg.com/236x/ab/c6/16/abc6166dbac9b4c99f701948dd507a7d.jpg"),
                  fit: BoxFit.cover,
                ),
                shape: const CircleBorder(),
              ),
            ),
          ),

          // Icon camera
          Positioned.fill(
            top: 5,
            child: SizedBox(
              width: 25.w,
              height: 25.w,
              child: const ImageIcon(
                AssetImage("assets/images/ic_camera_fill.png"),
                color: Colors.white,
              ),
            ),
          ),

          // Blok
          Positioned(
            bottom: 4.w,
            child: Container(
              width: 54.w,
              height: 26.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: ShapeDecoration(
                color: const Color(0xFF094181),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: Center(
                child: Text(
                  badge ?? "null",
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

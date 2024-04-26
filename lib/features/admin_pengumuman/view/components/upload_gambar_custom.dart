// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class UploadGambarCustom extends StatelessWidget {
  const UploadGambarCustom({
    Key? key,
    this.label,
    this.onTap,
    this.imagePath,
    this.imagePathObx,
    this.isObx = false,
  }) : super(key: key);

  final String? label;
  final void Function()? onTap;
  final String? imagePath;
  final RxString? imagePathObx;
  final bool? isObx;

  @override
  Widget build(BuildContext context) {
    // Upload Gambar
    return SizedBox(
      width: 381.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Label
          Text(
            (label == null) ? "Upload Gambar" : label!,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
              fontFamily: 'Nunito',
            ),
          ),

          8.verticalSpace,

          // Choose File
          Container(
            width: 381.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 8,
                  offset: Offset(2, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                // Button
                Container(
                  width: 110.w,
                  height: double.infinity,
                  padding: EdgeInsets.all(10.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF094181),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(2, 3),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Choose File',
                      textAlign: TextAlign.center,
                      style: NunitoTextStyle.fw800.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                8.horizontalSpace,

                // Text
                Expanded(
                  // Gunakan Expanded di sini
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: (isObx == false)
                        ? PathImageText(imagePath: imagePath)
                        : PathImageTextObx(imagePath: imagePathObx),
                  ),
                ),

                8.horizontalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PathImageTextObx extends StatelessWidget {
  const PathImageTextObx({
    super.key,
    required this.imagePath,
  });

  final RxString? imagePath;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        (imagePath.toString() == '' || imagePath == null)
            ? 'Upload gambar disini'
            : imagePath!.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: NunitoTextStyle.fw400.copyWith(
          color: const Color(0xFF9597A3),
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class PathImageText extends StatelessWidget {
  const PathImageText({
    super.key,
    required this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Text(
      (imagePath == '' || imagePath == null)
          ? 'Upload gambar disini'
          : imagePath!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: NunitoTextStyle.fw400.copyWith(
        color: const Color(0xFF9597A3),
        fontSize: 14.sp,
      ),
    );
  }
}

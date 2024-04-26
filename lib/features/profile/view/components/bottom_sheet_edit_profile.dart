// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetEditProfile extends StatelessWidget {
  const BottomSheetEditProfile({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    this.textInputType,
    required this.text,
    this.onTapCamera,
    this.onTapFile,
    this.isTextFieldOn = true,
    this.height,
  }) : super(key: key);

  final String label;
  final String hint;
  final String? icon;
  final TextInputType? textInputType;
  final String text;
  final void Function()? onTapCamera;
  final void Function()? onTapFile;
  final bool? isTextFieldOn;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 12.w, 24.w, 0),
      width: double.infinity,
      height: (height == null) ? 370.w : height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Bar
          Container(
            width: 100.w,
            height: 5.w,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          // Text
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.w),
            child: Text(
              'File Identitas',
              style: PoppinsTextStyle.fw600.copyWith(
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
          ),

          (isTextFieldOn == true)
              ?
              // TextField
              Column(
                  children: [
                    TextFieldEditProfile(
                      label: label,
                      hint: hint,
                      icon: icon,
                      textInputType: textInputType,
                    ),
                    15.verticalSpace,
                  ],
                )
              : Container(),

          // Foto
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Text(
                  text,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),

                12.verticalSpace,

                // Pilih
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Camera
                    Container(
                      width: 85.w,
                      height: 85.w,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: const Color(0xffEFF0F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: GestureDetector(
                          onTap: onTapCamera,
                          child: SvgPicture.asset("assets/fill/ic_camera.svg")),
                    ),

                    32.horizontalSpace,

                    // Folder
                    Container(
                      width: 85.w,
                      height: 85.w,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: const Color(0xffEFF0F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: GestureDetector(
                          onTap: onTapFile,
                          child: SvgPicture.asset("assets/fill/file-text.svg")),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Button Simpan
          ButtonGradientProfile(text: "Simpan", onPressed: () {}),
        ],
      ),
    );
  }
}

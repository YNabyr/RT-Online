import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibContent extends StatelessWidget {
  const TatibContent({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> listInformasi = Get.arguments;
    var description = listInformasi['description'];
    return Container(
      decoration: const BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      width: 334.w,
      child: SizedBox(
          child: Text(
        description,
        textAlign: TextAlign.justify,
        style: NunitoTextStyle.fw400.copyWith(
          color: const Color(0xFF0B0C0D),
          fontSize: 14.sp,
        ),
      )),
    );
  }
}

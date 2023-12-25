// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class EmptyTataTertibScreen extends StatelessWidget {
  const EmptyTataTertibScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Empty Tatib Images
        Image.asset("assets/images/empty_tata_tertib.png"),

        // Text
        Padding(
          padding: EdgeInsets.all(8.w),
          child: Text(
            'Belum ada Informasi Tata Tertib',
            textAlign: TextAlign.center,
            style: PoppinsTextStyle.fw500.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 20.sp,
            ),
          ),
        ),

        SizedBox(
          width: 283.w,
          child: Text(
            'Silahkan hubungi Admin untuk menambahkan Informasi',
            textAlign: TextAlign.center,
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}

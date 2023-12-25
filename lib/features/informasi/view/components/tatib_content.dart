import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibContent extends StatelessWidget {
  const TatibContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
      width: 334.w,
      child: SizedBox(
          child: Text(
        'Warga RT 58 RW 13 Pondok Griya Jaya Indah Kelurahan Munjul Jaya adalah warga yang menetap di wilayah RT 58 RW 13 Perum Pondok Griya Jaya Indah',
        textAlign: TextAlign.justify,
        style: NunitoTextStyle.fw400.copyWith(
          color: const Color(0xFF0B0C0D),
          fontSize: 14.sp,
        ),
      )),
    );
  }
}

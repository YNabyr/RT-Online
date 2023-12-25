import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TatibHeadline extends StatelessWidget {
  const TatibHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xffB5B7C4)),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      width: 334.w,
      child: SizedBox(
        child: Text(
          'Pendahuluan',
          style: NunitoTextStyle.fw600.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

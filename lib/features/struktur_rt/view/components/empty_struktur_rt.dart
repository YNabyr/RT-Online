import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class EmptyStrukturRt extends StatelessWidget {
  const EmptyStrukturRt({super.key});

  @override
  Widget build(BuildContext context) {
    // Container Column Image, Text
    return SizedBox(
      width: 283.w,
      child: Column(
        children: [
          // Image
          Image.asset(
            'assets/images/empty_struktur.png',
            fit: BoxFit.contain,
          ),

          // Text 1
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.w),
            child: Text(
              'Belum ada Struktur RT',
              textAlign: TextAlign.center,
              style: PoppinsTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 20.sp,
              ),
            ),
          ),

          // Text 2
          Text(
            'Silahkan hubungi Admin untuk menambahkan data',
            textAlign: TextAlign.center,
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class FooterAuth extends StatelessWidget {
  const FooterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 201.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Text Platform By
          Container(
            margin: EdgeInsets.only(bottom: 50.w),
            child: Text(
              'Platform By',
              style: NunitoTextStyle.fw700.copyWith(
                color: const Color(0xFF6454F0),
                fontSize: 7.sp,
              ),
            ),
          ),

          // Logo Rt Online
          SizedBox(
              width: 200.w,
              child: Image.asset("assets/images/logo_rt_horizontal.png")),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Background
            Container(
              width: 430.w,
              height: 270.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                ),
              ),
            ),

            // Text
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 89.5.w),

                  // Text
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Text(
                      'PERUM BUMI PALAPA',
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: Colors.white,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(6.r),
                    child: Text(
                      'RT 01',
                      style: PoppinsTextStyle.fw700.copyWith(
                        color: Colors.white,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(3.r),
                    child: Text(
                      'Mojolangu, Lowokwaru, Malang',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

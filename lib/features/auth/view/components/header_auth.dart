import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
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
              height: 210.h + safePadding(context),
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
            Padding(
              padding: EdgeInsets.only(top: 59.5.h + safePadding(context)),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 92.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'PERUM BUMI PALAPA',
                        style: PoppinsTextStyle.fw600.copyWith(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),

                      Text(
                        'RT 01',
                        style: PoppinsTextStyle.fw700.copyWith(
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),

                      Text(
                        'Mojolangu, Lowokwaru, Malang',
                        style: NunitoTextStyle.fw700.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

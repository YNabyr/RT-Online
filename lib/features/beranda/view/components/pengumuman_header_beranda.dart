import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PengumumanHeaderBeranda extends StatelessWidget {
  const PengumumanHeaderBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 3).w,
      child: Stack(
        children: [
          Row(
            children: [
              // Announcement Icon
              const ImageIcon(
                AssetImage("assets/images/ic_announcement.png"),
                color: Colors.black,
              ),

              SizedBox(width: 5.w),

              // Header Text
              Text(
                'Pengumuman Warga ',
                textAlign: TextAlign.center,
                style: NunitoTextStyle.fw600.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 16.sp,
                ),
              ),

              // Expanded to push Lihat semua to the right
              const Expanded(child: SizedBox.shrink()),

              // Lihat Semua Text
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Lihat semua',
                  textAlign: TextAlign.center,
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF6454F0),
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),

          // Circle Info
          Positioned.fill(
            left: 50.w,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 14.w,
                height: 14.w,

                decoration: ShapeDecoration(
                  color: const Color(0xFFD40202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(51),
                  ),
                ),

                // Text
                child: Text(
                  '5',
                  textAlign: TextAlign.center,
                  style: NunitoTextStyle.fw800.copyWith(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

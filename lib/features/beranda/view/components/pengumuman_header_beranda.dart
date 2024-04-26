import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class PengumumanHeaderBeranda extends StatelessWidget {
  const PengumumanHeaderBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    print(PengumumanController.to.listIsViewed);
    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 3.h),
      child: Stack(
        children: [
          Row(
            children: [
              // Announcement Icon
              SvgPicture.asset("assets/fill/Announcement.svg"),

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

              // notif
              Obx(
                () => (PengumumanController.to.listIsViewed
                        .where((e) => e == false)
                        .toList()
                        .isEmpty)
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          width: 14.w,
                          height: 14.h,

                          decoration: ShapeDecoration(
                            color: const Color(0xFFD40202),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(51),
                            ),
                          ),

                          // Text
                          child: Text(
                            PengumumanController.to.listIsViewed
                                .where((e) => e == false)
                                .toList()
                                .length
                                .toString(),
                            textAlign: TextAlign.center,
                            style: NunitoTextStyle.fw800.copyWith(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
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

          // // Circle Info
          // Obx(
          //   () => (PengumumanController.to.listIsViewed
          //           .where((e) => e == false)
          //           .toList()
          //           .isEmpty)
          //       ? const SizedBox()
          //       : Positioned.fill(
          //           left: 50.w,
          //           child: Align(
          //             alignment: Alignment.topCenter,
          //             child: Container(
          //               width: 14.w,
          //               height: 14.h,

          //               decoration: ShapeDecoration(
          //                 color: const Color(0xFFD40202),
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(51),
          //                 ),
          //               ),

          //               // Text
          //               child: Text(
          //                 PengumumanController.to.listIsViewed
          //                     .where((e) => e == false)
          //                     .toList()
          //                     .length
          //                     .toString(),
          //                 textAlign: TextAlign.center,
          //                 style: NunitoTextStyle.fw800.copyWith(
          //                   color: Colors.white,
          //                   fontSize: 10.sp,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          // ),
        ],
      ),
    );
  }
}

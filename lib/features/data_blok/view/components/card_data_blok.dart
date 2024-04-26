// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardDataBlok extends StatelessWidget {
  const CardDataBlok({
    Key? key,
    this.profileImage,
    this.profileName,
    this.profileNumber,
    this.profileBadge,
    this.hasData = false,
    this.houseId,
  }) : super(key: key);

  final String? profileImage;
  final String? profileName;
  final String? profileNumber;
  final String? profileBadge;
  final bool? hasData;
  final String? houseId;

  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.h,
        left: 24.w,
        right: 24.w,
      ),
      child: GestureDetector(
        onTap: () {},
        child: (hasData == true)
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 8,
                      offset: Offset(4, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),

                // Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Container
                        Container(
                          padding: EdgeInsets.all(8.w),
                          width: 66.w,
                          height: 66.h,

                          // Profile Image
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  DataBlokController.to.listPenduduk
                                      .where((citizen) =>
                                          citizen['house_id'] == houseId!)
                                      .map((e) => e['photo_url'])
                                      .elementAt(0)
                                      .toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: const OvalBorder(),
                            ),
                          ),
                        ),

                        // Blok
                        Positioned(
                          bottom: 4.h,
                          child: Container(
                            width: 35.w,
                            height: 14.h,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF094181),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: Center(
                              child: Text(
                                profileBadge!,
                                style: NunitoTextStyle.fw600.copyWith(
                                  color: const Color(0xFFE2DDFE),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Box
                        SizedBox(
                          width: 228.w,

                          // Text
                          child: Text(
                            DataBlokController.to.listPenduduk
                                .where((citizen) =>
                                    citizen['house_id'] == houseId!)
                                .map((e) => e['name'])
                                .elementAt(0)
                                .toString(),
                            style: NunitoTextStyle.fw600.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),

                        4.verticalSpace,

                        // Box
                        SizedBox(
                          width: 228.w,

                          // Text Profile Number
                          child: Text(
                            DataBlokController.to.listPenduduk
                                .where((citizen) =>
                                    citizen['house_id'] == houseId!)
                                .map((e) => e['phone_number'])
                                .elementAt(0)
                                .toString(),
                            style: NunitoTextStyle.fw400.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],
                    ),

                    // Icons
                    Container(
                      width: 48.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SizedBox(
                        width: 32.w,
                        height: 32.h,
                        child: const ImageIcon(
                          AssetImage("assets/images/ic_whatsapp.png"),
                          color: Color(0xff27D18A),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            :
            // hasData = false
            Container(
                height: 82.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 8,
                      offset: Offset(4, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    // Container
                    Container(
                      height: double.infinity,
                      width: 100.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE0E2EB),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          profileBadge!,
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),

                    15.horizontalSpace,

                    // Belum ada warga

                    Text(
                      'Belum ada warga',
                      style: NunitoTextStyle.fw600.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataWargaCard extends StatelessWidget {
  const DataWargaCard({
    Key? key,
    required this.profileImage,
    required this.profileName,
    required this.profileNumber,
    required this.profileBadge,
  }) : super(key: key);

  final String profileImage;
  final String profileName;
  final String profileNumber;
  final String profileBadge;

  @override
  Widget build(BuildContext context) {
    // Container
    return Padding(
      padding: EdgeInsets.only(bottom: 15.w),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const DataWargaBottomsheet();
              });
        },
        child: Container(
          width: 358.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
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
                    height: 66.w,

                    // Profile Image
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(profileImage),
                          fit: BoxFit.cover,
                        ),
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),

                  // Blok
                  Positioned(
                    bottom: 4.w,
                    child: Container(
                      width: 35.w,
                      height: 14.w,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF094181),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: Text(
                          profileBadge,
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
                      profileName,
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

                    // Text
                    child: Text(
                      profileNumber,
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
                height: 32.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: const ImageIcon(
                    AssetImage("assets/images/ic_whatsapp.png"),
                    color: Color(0xff27D18A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

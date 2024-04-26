// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class RekapBulananCard extends StatelessWidget {
  const RekapBulananCard({
    Key? key,
    required this.amount,
    this.onTap,
    this.isBayar = false,
  }) : super(key: key);

  final int amount;
  final void Function()? onTap;
  final bool? isBayar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 382.w,
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

        // Row Image profile, nama, button, nominal
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image Profile
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
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/564x/57/a0/33/57a033a6286934d52087b6f54c697e09.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
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
                        "C-9",
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

            8.horizontalSpace,

            // Nama
            Text(
              'Ahmad Sujadi',
              style: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 16.sp,
              ),
            ),

            8.horizontalSpace,

            // Column Button, nominal
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Button
                Container(
                  height: 22.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: ShapeDecoration(
                    color: (isBayar == true)
                        ? const Color(0xFF27D18A)
                        : const Color(0xFFD40202),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    (isBayar == false) ? 'Belum Terbayar' : "Terbayarkan",
                    textAlign: TextAlign.center,
                    style: NunitoTextStyle.fw600.copyWith(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ),

                4.verticalSpace,

                // Nominal
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format((amount != null) ? amount : 0),
                  style: PoppinsTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

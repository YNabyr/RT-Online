// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/detail_pemasukan_screen.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardLaporanKeuangan extends StatelessWidget {
  const CardLaporanKeuangan({
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
      onTap: (onTap != null)
          ? onTap
          : () {
              Get.toNamed(Routes.detailPemasukanRoute);
            },
      child: Container(
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

        // Row Image profile, nama, button, nominal
        child: Row(
          children: [
            // Image Profile
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

            // Column Text, nama, date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Text(
                  'Iuran Bulanan',
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                  ),
                ),

                // Nama
                Text(
                  'Ahmad Sujadi',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                // Date
                Text(
                  'Senin, 30 Okt 2023 08:00',
                  style: NunitoTextStyle.fw300.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                  ),
                )
              ],
            ),

            8.horizontalSpace,

            // Nominal
            Text(
              NumberFormat.currency(
                      locale: "id", decimalDigits: 0, symbol: "Rp ")
                  .format((amount != null) ? amount : 0),
              style: PoppinsTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

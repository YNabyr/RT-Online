// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/detail_pemasukan_screen.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/detail_pengeluaran_screen.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardPengeluaranKeuangan extends StatelessWidget {
  const CardPengeluaranKeuangan({
    Key? key,
    required this.amount,
    this.onTap,
  }) : super(key: key);

  final int amount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onTap != null)
          ? onTap
          : () {
              Get.toNamed(Routes.detailPengeluaranRoute);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Column nama, date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

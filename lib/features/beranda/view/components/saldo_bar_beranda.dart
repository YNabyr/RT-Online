// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class SaldoBarBeranda extends StatelessWidget {
  const SaldoBarBeranda({
    Key? key,
    this.onTap,
    this.amount,
    this.jumlahRumah,
    this.onTapRumah,
  }) : super(key: key);

  final void Function()? onTap;
  final int? amount;
  final int? jumlahRumah;
  final void Function()? onTapRumah;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 74.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: SizedBox(
        width: 248.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text Saldo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text
                Text(
                  'Saldo Kas RT',
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),

                // Saldo
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format((amount != null) ? amount : 0),
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),

            20.horizontalSpace,

            // Button Lihat
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(12),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF6EE2F5),
                            Color(0xFF6454F0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 2.w),
                        width: 56.w,
                        height: 20.w,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Lihat",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Vertical Divider
            SizedBox(
              width: 1.w,
              height: 54.w,
              child: const VerticalDivider(
                color: Color(0xffB5B7C4),
              ),
            ),

            // Jumlah Rumah
            Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text
                  Text(
                    'Jumlah Rumah',
                    textAlign: TextAlign.center,
                    style: NunitoTextStyle.fw800.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 10.sp,
                    ),
                  ),

                  // Jumlah Rumah
                  GestureDetector(
                    onTap: onTapRumah,
                    child: Text(
                      jumlahRumah.toString(),
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 20.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

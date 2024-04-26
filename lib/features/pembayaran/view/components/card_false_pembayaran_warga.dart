// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/features/pembayaran/controllers/pembayaran_controller.dart';
import 'package:venturo_core/features/pembayaran/view/components/checkbox_pembayaran_warga.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox_2.dart';

import '../../../../shared/styles/google_text_style.dart';

class CardFalsePembayaranWarga extends StatelessWidget {
  CardFalsePembayaranWarga({
    Key? key,
    required this.bulan,
    required this.nominal,
    this.isChecked = false,
    this.onChange,
  }) : super(key: key);

  final String bulan;
  final int nominal;
  Function(bool value)? onChange;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
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
        child: Row(
          children: [
            // Checkbox

            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CheckboxPembayaran(
                isChecked: isChecked,
                onChange: onChange,
              ),
            ),

            // Column Bulan, nominal
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bulan
                Text(
                  bulan,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                // Nominal
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format((nominal != null) ? nominal : 0),
                  style: NunitoTextStyle.fw600.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),

            Expanded(child: Container()),

            // Button
            Container(
              width: 100.w,
              height: 22.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: ShapeDecoration(
                color: const Color(0xFFD40202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                "Belum Terbayar",
                style: NunitoTextStyle.fw600.copyWith(
                  color: Colors.white,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

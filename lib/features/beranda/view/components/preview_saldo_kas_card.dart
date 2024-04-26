// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class PreviewSaldoKasCard extends StatelessWidget {
  const PreviewSaldoKasCard({
    Key? key,
    this.note,
    required this.bulan,
  }) : super(key: key);

  final String? note;
  final String bulan;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card
        Container(
          margin: EdgeInsets.only(top: 25.w, bottom: 15.h),
          width: 382.w,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              12.verticalSpace,

              // Saldo Awal
              buildContent(title: "Saldo Awal (Oktober)", nominal: 8550000),

              // Pemasukan
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: buildContent(title: "Pemasukan", nominal: 3200000),
              ),

              // Pengeluaran
              buildContent(title: "Pengeluaran", nominal: 1750000),

              12.verticalSpace,

              const Divider(
                color: Color(0xffB5B7C4),
              ),

              16.verticalSpace,

              // Saldo Kas Saat ini
              buildSaldoNow(nominal: 13500000),

              // Note
              if (note != null)
                Padding(
                  padding: EdgeInsets.only(top: 18.h),
                  child: Row(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        note!,
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(),
            ],
          ),
        ),

        // Container
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              decoration: ShapeDecoration(
                color: const Color(0xFF6454F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              // Text
              child: Text(
                textAlign: TextAlign.center,
                bulan,
                style: NunitoTextStyle.fw600.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildSaldoNow({int? nominal}) {
    return Row(
      children: [
        // Text
        Text(
          'Saldo kas saat ini',
          style: NunitoTextStyle.fw600.copyWith(
            color: const Color(0xFF221A8B),
            fontSize: 16.sp,
          ),
        ),

        Expanded(child: Container()),

        // Text Nominal
        Text(
          NumberFormat.currency(locale: "id", decimalDigits: 0, symbol: "Rp ")
              .format((nominal != null) ? nominal : 0),
          style: NunitoTextStyle.fw600.copyWith(
            color: const Color(0xFF221A8B),
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Row buildContent({required String title, int? nominal}) {
    return Row(
      children: [
        // Text
        Text(
          title,
          style: NunitoTextStyle.fw400.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 14.sp,
          ),
        ),

        Expanded(child: Container()),

        // Text Nominal
        Text(
          NumberFormat.currency(locale: "id", decimalDigits: 0, symbol: "Rp ")
              .format((nominal != null) ? nominal : 0),
          style: NunitoTextStyle.fw800.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

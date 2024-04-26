// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/features/admin_iuran/view/components/bottom_sheet_riwayat_edit_iuran.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardAdminKategoriIuran extends StatelessWidget {
  const CardAdminKategoriIuran({
    Key? key,
    this.note,
    this.warga,
    this.onTap,
    required this.itemCount,
    this.title,
    this.nominal,
    this.totalNominal,
  }) : super(key: key);

  final String? note;
  final int? warga;
  final void Function()? onTap;
  final int itemCount;
  final List<dynamic>? title;
  final List<int>? nominal;
  final int? totalNominal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card
        Container(
          margin: EdgeInsets.only(top: 25.h, bottom: 15.h),
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

              for (var i = 0; i < itemCount; i++)
                Column(
                  children: [
                    // Saldo Awal
                    buildContent(title: "${title?[i]}", nominal: nominal?[i]),

                    (i == itemCount - 1) ? 12.verticalSpace : 18.verticalSpace,
                  ],
                ),

              const Divider(
                color: Color(0xffB5B7C4),
              ),

              16.verticalSpace,

              // Saldo Kas Saat ini
              buildSaldoNow(nominal: totalNominal ?? 0),

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

              18.verticalSpace,

              // Row Button, Ic history
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 100.w,
                      height: 30.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF094181),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ic edit
                          SvgPicture.asset(
                            "assets/outline/edit-2.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                            height: 15.h,
                          ),

                          8.horizontalSpace,

                          // Text
                          Text(
                            'Edit Iuran',
                            style: NunitoTextStyle.fw700.copyWith(
                              color: Colors.white,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  15.horizontalSpace,

                  // ic history
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        scrollControlDisabledMaxHeightRatio: double.infinity,
                        context: context,
                        builder: (BuildContext ctx) {
                          return const BottomSheetRiwayatEditIuran();
                        },
                      );
                    },
                    child: SvgPicture.asset("assets/outline/History.svg"),
                  ),
                ],
              ),
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
                "${(warga == null) ? 0 : warga} Warga",
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
          'Total Iuran',
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
          style: NunitoTextStyle.fw400.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

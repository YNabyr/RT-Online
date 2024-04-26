// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_detail_pengeluaran_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class CardAdminUangKeluar extends StatelessWidget {
  const CardAdminUangKeluar({
    Key? key,
    this.isFilter = false,
    required this.keteranganPengeluaran,
    required this.total,
    required this.date,
    required this.detailPengeluaran,
    required this.keterangan,
    required this.banyak,
    required this.nominal,
  }) : super(key: key);

  final bool? isFilter;
  final String keteranganPengeluaran;
  final int total;
  final String date;
  final List<Map<String, dynamic>> detailPengeluaran;
  final String keterangan;
  final int banyak;
  final int nominal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.adminDetailPengeluaranRoute,
          arguments: {
            "keterangan_pengeluaran": keteranganPengeluaran,
            "total": total,
            "date": date,
            "detail_pengeluaran": detailPengeluaran,
            "keterangan": keterangan,
            "banyak": banyak,
            "nominal": nominal,
          },
        );
      },
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
        child: Column(
          children: [
            (isFilter == false)
                ? Container()
                :
                //
                Column(
                    children: [
                      Text(
                        date,
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF6454F0),
                          fontSize: 16.sp,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),

            // Row
            SizedBox(
              height: 46.h,
              child: Row(
                children: [
                  // Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keteranganPengeluaran,
                          style: NunitoTextStyle.fw800.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          keterangan,
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // NOminal
                  Text(
                    nominal.toString(),
                    style: PoppinsTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 20.sp,
                    ),
                  )
                ],
              ),
            ),

            8.verticalSpace,

            //
            Row(
              children: [
                //
                SizedBox(
                  child: Text(
                    'Banyak   :   ',
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 13.sp,
                    ),
                  ),
                ),

                //
                Expanded(
                  child: Text(
                    banyak.toString(),
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 13.sp,
                    ),
                  ),
                )
              ],
            ),

            //
            Row(
              children: [
                //
                SizedBox(
                  child: Text(
                    'Total       :   ',
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 13.sp,
                    ),
                  ),
                ),

                //
                Expanded(
                  child: Text(
                    total.toString(),
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 13.sp,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

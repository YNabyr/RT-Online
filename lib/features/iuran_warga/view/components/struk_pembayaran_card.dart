import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class StrukPembayaranCard extends StatelessWidget {
  const StrukPembayaranCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Container Card
    var amount = 300000;
    return Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // column
      child: Column(
        children: [
          // header
          Container(
            width: 358.w,
            padding: EdgeInsets.only(bottom: 6.w),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFB5B7C4)))),
            child: Column(
              children: [
                // Image logo
                SvgPicture.asset(
                  'assets/images/logo_rt_online_horizontal.svg',
                  height: 62.w,
                ),

                39.verticalSpace,

                // Row date, id
                Row(
                  children: [
                    // Text
                    Text(
                      '05 Ags 2023, 14:33',
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 10.sp,
                      ),
                    ),

                    Expanded(child: Container()),

                    // id
                    Text(
                      'No ID: B123/072023',
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          24.verticalSpace,

          // pembayaran bulan
          Container(
            width: 358.w,
            padding: EdgeInsets.only(bottom: 20.w),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffB5B7C4),
                ),
              ),
            ),
            child: Column(
              children: [
                // Icon checkmark
                SvgPicture.asset(
                  "assets/images/checkmark_circle_fill.svg",
                  height: 42.w,
                ),

                // Text Pembayaran Sukses
                Text(
                  'Pembayaran Sukses',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF27D18A),
                    fontSize: 16.sp,
                  ),
                ),

                35.verticalSpace,

                // Text Pembayaran Bulan
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pembayaran Bulan',
                    style: NunitoTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  ),
                ),

                // Row
                Container(
                  width: 358.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
                  child: Row(
                    children: [
                      // Icon Image
                      const ImageIcon(
                          AssetImage("assets/images/ic_arrow_ios_right.png")),
                      8.horizontalSpace,

                      // Bulan
                      Text(
                        'Januari',
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      Expanded(child: Container()),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: "id", decimalDigits: 0, symbol: "Rp ")
                            .format((amount != null) ? amount : 0),
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                // Container Row Total Pembayaran
                Container(
                  width: 358.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: const BoxDecoration(color: Color(0xFFEFF0F5)),
                  child: Row(
                    children: [
                      // Text
                      Text(
                        'Total Pembayaran',
                        style: NunitoTextStyle.fw700.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      Expanded(child: Container()),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: "id", decimalDigits: 0, symbol: "Rp ")
                            .format((amount != null) ? amount : 0),
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                15.verticalSpace,

                // Container Row Metode Pembayaran
                Container(
                  width: 358.w,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      // Metode pembayaran
                      Text(
                        'Metode Pembayaran',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      Expanded(child: Container()),

                      // Bank
                      Text(
                        'Bank Transfer - BRI',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // info warga
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: SizedBox(
              width: 358.w,
              child: Column(
                children: [
                  // Row Nama Warga
                  Row(
                    children: [
                      // Nama warga
                      Text(
                        'Nama Warga',
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      Expanded(child: Container()),

                      // Nama
                      Text(
                        'Budi Sudarmaji',
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  // Row No Telepon
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.w),
                    child: Row(
                      children: [
                        // No Telepon
                        Text(
                          'No Telepon',
                          style: NunitoTextStyle.fw800.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 14.sp,
                          ),
                        ),

                        Expanded(child: Container()),

                        // no telepon
                        Text(
                          '081230308282',
                          style: NunitoTextStyle.fw800.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Row No Rumah
                  Row(
                    children: [
                      // No Rumah
                      Text(
                        'No. Rumah',
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      Expanded(child: Container()),

                      // Nama
                      Text(
                        'C-23',
                        style: NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // footer
          Container(
            width: 358.w,
            padding: EdgeInsets.only(
              top: 24.w,
              left: 24.w,
              right: 24.w,
              bottom: 14.w,
            ),
            child: Column(
              children: [
                // Text
                Text(
                  'Terima kasih sudah melakukan pembayaran di Perumahan Bumi Palapa, Semoga dukungan dan kontribusi bapak/ibu/i dapat meningkatkan kemajuan dan kesejahteraan kita bersama.',
                  textAlign: TextAlign.center,
                  style: NunitoTextStyle.fw400.copyWith(
                    color: Colors.black,
                    fontSize: 10.sp,
                  ),
                ),

                10.verticalSpace,

                // Nama
                Text(
                  'Pak RT - Pendik Salim',
                  textAlign: TextAlign.center,
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),

                // Date
                Text(
                  '06 Ags 2023, 07:09',
                  textAlign: TextAlign.center,
                  style: PoppinsTextStyle.fw400.copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

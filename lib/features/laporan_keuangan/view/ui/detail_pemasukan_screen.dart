import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/features/iuran_warga/view/components/bottom_sheet_rekap_bulanan.dart';
import 'package:venturo_core/features/laporan_keuangan/constants/laporan_keuangan_assets_constant.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_pengeluaran_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/expansion_tile_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/header_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/textfield_detail_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/tobar_laporan_keuangan.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_pembayaran_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';

class DetailPemasukanScreen extends StatelessWidget {
  DetailPemasukanScreen({Key? key}) : super(key: key);

  final assetsConstant = LaporanKeuanganAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var nominal = 300000;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderLaporanKeuangan(title: "Pemasukan"),

            23.verticalSpace,

            // TextField
            const TextfieldDetailKeuangan(
                label: "Nama", keterangan: "Ahmad Sujadi"),

            15.verticalSpace,

            // TextField
            const TextfieldDetailKeuangan(
                label: "Jenis Pemasukan", keterangan: "Sumbangan"),

            15.verticalSpace,
            // TextField
            const TextfieldDetailKeuangan(
                label: "Nominal", keterangan: "Rp 1.000.000"),

            15.verticalSpace,

            Container(
              width: 382.w,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFF0B0C0D)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bold Text
                  Text(
                    'Detail Iuran',
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 14.sp,
                    ),
                  ),

                  15.verticalSpace,

                  // Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'Iuran Sep 2023',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: "Rp ")
                            .format((nominal != null) ? nominal : 0),
                        style: NunitoTextStyle.fw400.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  // Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'Iuran Sep 2023',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: "Rp ")
                            .format((nominal != null) ? nominal : 0),
                        style: NunitoTextStyle.fw400.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  // Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'Iuran Sep 2023',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        ),
                      ),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: "Rp ")
                            .format((nominal != null) ? nominal : 0),
                        style: NunitoTextStyle.fw400.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  // Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'Total Iuran',
                        style: NunitoTextStyle.fw700.copyWith(
                            color: const Color(0xFF0B0C0D), fontSize: 16.sp),
                      ),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: "Rp ")
                            .format((nominal != null) ? nominal : 0),
                        style: NunitoTextStyle.fw700.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xFF0B0C0D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            15.verticalSpace,
            // TextField
            const TextfieldDetailKeuangan(
                label: "Tanggal", keterangan: "Senin, 30 Okt 2023 09:00"),

            15.verticalSpace,
            // TextField
            const TextfieldDetailKeuangan(
                label: "Diterima Oleh", keterangan: "Abdullah"),

            35.verticalSpace,
            // Bukti
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 358.w,
                    height: 109.w,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://www.uspace.id/wp-content/uploads/2022/03/bukti-transfer-m-banking-bca-asli..jpg",
                        ),
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),

                // Button
                Positioned(
                  top: (109.w - 24.w) / 2, // Mengatur posisi vertical tengah
                  left: (358.w - 24.w) / 2, // Mengatur posisi horizontal tengah
                  child: eyeButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget eyeButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Button
          Positioned(
            child: Container(
              width: 35.w,
              height: 35.w,
              decoration: ShapeDecoration(
                color: const Color(0xFF094181),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // Svg
          Positioned(
            top: (35.w - 26.w) / 2,
            left: (35.w - 26.w) / 2,
            child: SvgPicture.asset("assets/images/ic_eye_on_fill.svg",
                height: 26.w),
          ),
        ],
      ),
    );
  }
}

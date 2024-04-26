import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/features/pembayaran/constants/pembayaran_assets_constant.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/checkbox_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/expansion_tile_pembayaran.dart';
import 'package:venturo_core/features/pembayaran/view/components/header_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/topbar_pembayaran_warga.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';

import '../../../../shared/styles/google_text_style.dart';

class PembayaranScreen extends StatelessWidget {
  PembayaranScreen({Key? key}) : super(key: key);

  final assetsConstant = PembayaranAssetsConstant();

  var date = Get.arguments['date'];
  var listBayar = Get.arguments['nominal'];
  var listBulan = Get.arguments['bulan'];
  var totalPembayaran = Get.arguments['total_pembayaran'];

  @override
  Widget build(BuildContext context) {
    print(listBayar);
    var nominal = 300000;
    int length;
    var amount = 300000;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderPembayaranWarga(
              title: "Pembayaran",
            ),

            25.verticalSpace,

            // Row date, no
            SizedBox(
              width: 382.w,
              child: Row(
                children: [
                  // date
                  Text(
                    '$date',
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  ),

                  Expanded(child: Container()),
                  // No
                  Text(
                    'No : RT - 01/12334',
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),

            27.verticalSpace,

            // detail card
            Container(
              width: 381.w,
              padding: EdgeInsets.all(24.w),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // Expansion Tile
                  for (var i = 0; i < listBayar.length; i++)
                    CustomExpansionTile(
                      amount: listBayar[i],
                      title: listBulan[i],
                      children: List.generate(
                        length = 3,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            bottom: (index != length - 1) ? 8.h : 0,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            decoration: (index != length - 1)
                                ? const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Color(0xFFB5B7C4),
                                      ),
                                    ),
                                  )
                                : null,
                            child: Row(
                              children: [
                                Text(
                                  'Iuran Pengelolaan',
                                  style: NunitoTextStyle.fw400.copyWith(
                                    color: const Color(0xFF0B0C0D),
                                    fontSize: 14.sp,
                                  ),
                                ),

                                Expanded(child: Container()),

                                // Nominal
                                Text(
                                  NumberFormat.currency(
                                          locale: "id",
                                          decimalDigits: 0,
                                          symbol: "Rp ")
                                      .format(
                                          (amount != null) ? amount / 3 : 0),
                                  style: NunitoTextStyle.fw400.copyWith(
                                    color: const Color(0xFF0B0C0D),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  8.verticalSpace,

                  // Total Pembayaran
                  Container(
                    padding: EdgeInsets.only(top: 12.h),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Color(0xFFB5B7C4)),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Text
                        Text(
                          'Total Pembayaran',
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),

                        Expanded(child: Container()),

                        // Nominal
                        Text(
                          NumberFormat.currency(
                                  locale: "id", decimalDigits: 0, symbol: "Rp ")
                              .format((totalPembayaran != null)
                                  ? totalPembayaran
                                  : 0),
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            27.verticalSpace,

            //  Text metode pembayaran
            SizedBox(
              width: 381.w,
              child: Text(
                textAlign: TextAlign.start,
                'Metode Pembayaran',
                style: PoppinsTextStyle.fw600.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 20.sp,
                ),
              ),
            ),

            15.verticalSpace,

            // metode pembayaran card
            Container(
              width: 381.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  )
                ],
              ),

              // Column
              child: ExpansionTilePembayaran(
                title: "Bank Transfer ",
                textStyle: NunitoTextStyle.fw500.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 16.sp,
                ),
                child: Column(
                  children: [
                    9.verticalSpace,

                    // Bank Bca
                    buildMetodePembayaran(
                      assetImage: "assets/images/logo_bca.png",
                      name: 'An. Rojali Sudirman',
                      noRek: '801 - 234 - 5678',
                    ),

                    8.verticalSpace,

                    // Bank Mandiri
                    buildMetodePembayaran(
                      assetImage: 'assets/images/logo_mandiri.png',
                      noRek: '801 - 234 - 5678',
                      name: 'An. Rojali Sudirman',
                    ),
                  ],
                ),
              ),
            ),

            15.verticalSpace,

            // Qris
            Container(
              width: 381.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(4, 3),
                    spreadRadius: 0,
                  )
                ],
              ),

              // Column
              child: ExpansionTilePembayaran(
                title: "Qris",
                textStyle: NunitoTextStyle.fw500.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 16.sp,
                ),
                child: Column(
                  children: [
                    9.verticalSpace,
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2, color: Color(0xFFB5B7C4)),
                        ),
                      ),
                      child: Center(
                        child: QrImageView(
                          data: "https://pub.dev/packages/qr_flutter/install",
                          size: 160.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            15.verticalSpace,

            // Upload Gambar
            SizedBox(
              width: 381.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Label
                  Text(
                    "Upload Gambar",
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 14.sp,
                      fontFamily: 'Nunito',
                    ),
                  ),

                  8.verticalSpace,

                  // Choose File
                  Container(
                    width: 381.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(2, 3),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Button
                        Container(
                          width: 110.w,
                          height: double.infinity,
                          padding: EdgeInsets.all(10.w),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF094181),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 8,
                                offset: Offset(2, 3),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Text(
                            'Choose File',
                            textAlign: TextAlign.center,
                            style: NunitoTextStyle.fw800.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),

                        8.horizontalSpace,

                        // Text
                        Text(
                          'Upload gambar disini',
                          style: NunitoTextStyle.fw400.copyWith(
                            color: const Color(0xFF9597A3),
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            40.verticalSpace,

            // Button
            ButtonGradientDataWarga(text: "Chat WA", onPressed: () {}),

            24.verticalSpace,
          ],
        ),
      ),
    );
  }

  Container buildMetodePembayaran({
    required String assetImage,
    required String noRek,
    required String name,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: Color(0xFFB5B7C4)),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Container(
            width: 93.w,
            height: 47.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // No
              Text(
                noRek,
                style: NunitoTextStyle.fw600.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 16.sp,
                ),
              ),

              // Nama
              Text(
                name,
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),

          // Icon copy
          SvgPicture.asset(
            "assets/images/ic_copy.svg",
            height: 24.h,
          ),
        ],
      ),
    );
  }
}

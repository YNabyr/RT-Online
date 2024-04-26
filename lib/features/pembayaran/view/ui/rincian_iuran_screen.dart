import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/data_warga/view/components/button_gradient_data_warga.dart';
import 'package:venturo_core/features/pembayaran/constants/pembayaran_assets_constant.dart';
import 'package:venturo_core/features/pembayaran/controllers/pembayaran_controller.dart';
import 'package:venturo_core/features/pembayaran/repositories/pembayaran_repository.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_false_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/checkbox_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/header_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/components/topbar_pembayaran_warga.dart';
import 'package:venturo_core/features/pembayaran/view/ui/pembayaran_screen.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox_2.dart';

import '../../../../shared/styles/google_text_style.dart';

class RincianIuranScreen extends StatelessWidget {
  const RincianIuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  // TopBar
                  const HeaderPembayaranWarga(
                    title: "Pembayaran Warga",
                  ),

                  // Button
                  Container(
                    margin: EdgeInsets.only(top: 78.h + safePadding(context)),
                    child: const Center(
                      child: TopBarPembayaranWarga(
                        text: "2023",
                      ),
                    ),
                  ),
                ],
              ),

              41.verticalSpace,

              // Card, Checkbox

              Expanded(
                child: ListView.builder(
                  itemCount: PembayaranController.to.listPembayaran.length,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemBuilder: (ctx, index) {
                    return (PembayaranController.to.listPembayaran[index]
                                ['terbayar'] ==
                            true)
                        ? CardPembayaranWarga(
                            key: ValueKey(index),
                            bulan: PembayaranController.to.listPembayaran[index]
                                ['bulan'],
                            nominal: PembayaranController.to.listNominal[index],
                            isBayar: PembayaranController
                                .to.listPembayaran[index]['terbayar'],
                          )
                        : Obx(
                            () => CardFalsePembayaranWarga(
                              key: ValueKey(
                                  PembayaranController.to.listCheck[index]),
                              isChecked:
                                  PembayaranController.to.listCheck[index],
                              onChange: (value) {
                                print(value);
                                PembayaranController.to.listCheck[index] =
                                    value;

                                // Hitung totalJumlah dan JumlahPembayaran
                                PembayaranController.to.getJumlahTotal(index);
                                PembayaranController.to
                                    .getJumlahPembayaran(index);
                                PembayaranController.to.getListBayar(index);
                                PembayaranController.to.getBulan(index);

                                // Mengecek listCheck
                                if (PembayaranController.to.listCheck
                                    .contains(false)) {
                                  PembayaranController.to.isCheckedAll.value =
                                      false;
                                } else if (PembayaranController.to.listCheck
                                    .every((element) => element == true)) {
                                  PembayaranController.to.isCheckedAll.value =
                                      true;
                                }

                                print(
                                    PembayaranController.to.isCheckedAll.value);
                              },
                              bulan: PembayaranController
                                  .to.listPembayaran[index]['bulan'],
                              nominal:
                                  PembayaranController.to.listNominal[index],
                            ),
                          );
                  },
                ),
              ),

              (94 + 15).verticalSpace
            ],
          ),

          // Bottom
          Positioned(
            bottom: 0,
            child: Container(
              width: 430.w,
              height: 94.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 8,
                    offset: Offset(0, -4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Obx(
                () => Row(
                  children: [
                    CheckboxPembayaran(
                      isChecked: PembayaranController.to.isCheckedAll.value,
                      onChange: (value) {
                        PembayaranController.to.isCheckedAll.value = value;

                        for (var i =
                                PembayaranController.to.listTrueCheck.length;
                            i < PembayaranController.to.listCheck.length;
                            i++) {
                          if (PembayaranController.to.listCheck[i] == !value) {
                            PembayaranController.to.listCheck[i] = value;
                            PembayaranController.to.getJumlahTotal(i);
                            PembayaranController.to.getJumlahPembayaran(i);
                            PembayaranController.to.getListBayar(i);
                            PembayaranController.to.getBulan(i);
                          }
                        }

                        print(PembayaranController.to.listCheck);
                      },
                    ),

                    8.horizontalSpace,

                    // Bayar semua
                    Text(
                      'Bayar semua',
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 10.sp,
                      ),
                    ),

                    Expanded(child: Container()),

                    // Column total pembayaran, nominal
                    Column(
                      children: [
                        // Total Pembayaran
                        Text(
                          'Total Pembayaran',
                          style: NunitoTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),

                        // Nominal
                        Text(
                          NumberFormat.currency(
                                  locale: "id", decimalDigits: 0, symbol: "Rp ")
                              .format((PembayaranController
                                          .to.totalPembayaran.value !=
                                      null)
                                  ? PembayaranController
                                      .to.totalPembayaran.value
                                  : 0),
                          style: PoppinsTextStyle.fw600.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),

                    12.horizontalSpace,

                    // Button
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.pembayaranRoute,
                          arguments: {
                            "date": PembayaranController.to
                                .formatTanggal(DateTime.now().toString()),
                            "nominal": PembayaranController.to.listBayar,
                            "bulan": PembayaranController.to.bulan,
                            'total_pembayaran':
                                PembayaranController.to.totalPembayaran.value,
                          },
                        );
                      },
                      child: Container(
                        width: 121.w,
                        height: 54.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF6EE2F5),
                              Color(0xFF6454F0),
                            ], // Sesuaikan dengan warna yang diinginkan
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Obx(
                          () => Text(
                            'Bayar (${PembayaranController.to.totalJumlah})',
                            textAlign: TextAlign.center,
                            style: NunitoTextStyle.fw700.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

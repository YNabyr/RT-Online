import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/constants/admin_konfirmasi_pembayaran_assets_constant.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/view/components/card_admin_konfirmasi_pembayaran.dart';
import 'package:venturo_core/features/iuran_warga/view/components/button_rekap_bulanan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminKonfirmasiPembayaranScreen extends StatelessWidget {
  AdminKonfirmasiPembayaranScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminKonfirmasiPembayaranAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Header
            const CustomHeaderAdmin(title: "Konfirmasi Pembayaran"),

            25.verticalSpace,

            // Tabbar
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              dividerColor: Colors.grey,
              dividerHeight: 2.h,
              indicatorWeight: 2.w,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xFF6454F0),
              labelColor: const Color(0xFF6454F0),
              unselectedLabelColor: const Color(0xff9597A3),
              tabs: [
                Tab(
                  child: buildTab(text: "Blok A", warga: 10),
                ),
                Tab(
                  child: buildTab(text: "Blok B", warga: 20),
                ),
                Tab(
                  child: buildTab(text: "Blok C", warga: 12),
                ),
                Tab(
                  child: buildTab(text: "Blok D", warga: 5),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  // Blok A
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  const CardAdminKonfirmasiPembayaran(
                                      amount: 1000),
                                  15.verticalSpace,
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Blok B
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,
                    ],
                  ),

                  // Blok C
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,
                    ],
                  ),

                  // Blok D
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildButton() {
    return Column(
      children: [
        // Button
        SizedBox(
          width: 382.w,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Button Sudah Terbayar
              ButtonRekapBulanan(
                header: "Sudah Terbayar",
                warga: 7,
                amount: 5000000,
              ),

              // Button Belum Terbayar
              ButtonRekapBulanan(
                header: "Belum Terbayar",
                amount: 1000000,
                warga: 3,
                isBayar: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildTab({required String text, int? warga}) {
    return Column(
      children: [
        // Text
        Text(
          'Blok A',
          style: NunitoTextStyle.fw700.copyWith(
            fontSize: 16.sp,
          ),
        ),

        // jumlah Warga
        Text(
          '${(warga == null) ? 0 : warga} Warga',
          style: NunitoTextStyle.fw500.copyWith(
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

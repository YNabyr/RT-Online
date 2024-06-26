// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/beranda/view/components/alert_keuangan_beranda.dart';

import 'package:venturo_core/features/beranda/view/components/header_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/preview_saldo_kas_card.dart';
import 'package:venturo_core/features/beranda/view/components/top_bar_preview_kas.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

class PreviewSaldoKasScreen extends StatelessWidget {
  const PreviewSaldoKasScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF0F5),
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // TopBar
                      const HeaderBeranda(
                        text: "Preview",
                        prefixIcon: Icons.arrow_back_ios_new_rounded,
                      ),

                      // Button
                      Container(
                        margin:
                            EdgeInsets.only(top: 78.h + safePadding(context)),
                        child: const Center(
                          child: TopBarPreviewKas(
                            text: "2023",
                          ),
                        ),
                      )
                    ],
                  ),

                  27.verticalSpace,

                  // Card
                  const PreviewSaldoKasCard(
                    bulan: "November",
                    note: "*) Data Update pertanggal 17 Nov 2023, 13.00 WIB",
                  ),

                  // Card
                  const PreviewSaldoKasCard(
                    bulan: "Oktober",
                  ),
                ],
              ),
            ),

            // Alert
            Positioned(
              right: 0,
              bottom: 30.h,
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.laporanKeuanganRoute);
                  },
                  child: const AlertKeuanganBeranda()),
            ),

            // Image
            Positioned(
              right: 0.w,
              bottom: 6.h,
              child: SizedBox(
                child: Image.asset("assets/images/paper_pen.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/features/beranda/constants/beranda_assets_constant.dart';
import 'package:venturo_core/features/beranda/view/components/alert_iuran_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/alert_iuran_safe_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/alert_iuran_warning_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/image_slider_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_card_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/profile_bar_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/saldo_bar_beranda.dart';

class BerandaScreen extends StatelessWidget {
  BerandaScreen({
    Key? key,
    this.isDue = true,
  }) : super(key: key);

  final bool isDue;

  final assetsConstant = BerandaAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Bacground Header
                      Container(
                        width: 430.w,
                        height: 170.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                          ),
                        ),
                      ),

                      // Profile Bar
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 24.h),
                          child: ProfileBarBeranda(
                            iconPressed: () {},
                            onTapProfile: () {},
                          ),
                        ),
                      ),

                      // Saldo Bar
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 126.h),
                          child: SaldoBarBeranda(
                            amount: 10000000,
                            jumlahRumah: 50,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),

                  27.verticalSpace,

                  // Banner Slide
                  const ImageSliderBeranda(),

                  25.verticalSpace,

                  // Pengumuman Card
                  const PengumumanCardBeranda(),

                  26.verticalSpace,
                ],
              ),
            ),
          ),

          // Alert Iuran
          (isDue)

              // IsDue = true
              ? Stack(
                  children: [
                    AlertIuranBeranda(isDue: isDue),
                    AlertIuranSafeBeranda(isDue: isDue),
                    const AlertIuranWarningBeranda(),
                  ],
                )
              :

              // IsDue = false
              Stack(
                  children: [
                    AlertIuranBeranda(isDue: isDue),
                    AlertIuranSafeBeranda(isDue: isDue),
                  ],
                ),
        ],
      ),
    );
  }
}

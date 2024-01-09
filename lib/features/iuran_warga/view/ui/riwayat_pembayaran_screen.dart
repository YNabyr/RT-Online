import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_riwayat_pembayaran.dart';
import 'package:venturo_core/features/iuran_warga/view/components/riwayat_pembayaran_card.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';

class RiwayatPembayaranScreen extends StatelessWidget {
  const RiwayatPembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Topbar
              const TopBarIuranWarga(
                title: "Riwayat Pembayaran",
                suffixIcon: "assets/images/ic_filter.svg",
              ),

              25.verticalSpace,

              // Riwayat Pembayaran Card
              const RiwayatPembayaranCard(),

              50.verticalSpace,

              const RiwayatPembayaranCard(
                isTahun: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

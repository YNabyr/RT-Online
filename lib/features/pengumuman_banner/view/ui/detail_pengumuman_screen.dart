import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_pengumuman_card.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/topbar_pengumuman.dart';

class DetailPengumumanScreen extends StatelessWidget {
  const DetailPengumumanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              // Topbar
              const TopBarPengumuman(title: "Pengumuman"),

              32.verticalSpace,

              // Card
              (PengumumanController.to.detailIsLoading.value == true)
                  ? const CircularProgressIndicator()
                  : DetailPengumumanCard(),
            ],
          ),
        ),
      ),
    );
  }
}

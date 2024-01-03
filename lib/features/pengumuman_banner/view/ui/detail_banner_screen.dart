import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_banner_card.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/topbar_pengumuman.dart';

class DetailBannerScreen extends StatelessWidget {
  const DetailBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Topbar
          const TopBarPengumuman(title: "Banner"),

          32.verticalSpace,

          // Card
          DetailBannerCard(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_content_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_header_beranda.dart';

class PengumumanCardBeranda extends StatelessWidget {
  const PengumumanCardBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Section
          const PengumumanHeaderBeranda(),

          // Divider
          const Divider(
            color: Color(0xffEFF0F5),
            thickness: 1,
          ),

          // Content Section
          Padding(
            padding: EdgeInsets.only(top: 7.5.w),
            child: const Column(
              children: [
                // Pinned Content
                PengumumanContentBeranda(isPinned: true),

                // Regular Content
                PengumumanContentBeranda(),

                PengumumanContentBeranda(),

                PengumumanContentBeranda(isLast: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

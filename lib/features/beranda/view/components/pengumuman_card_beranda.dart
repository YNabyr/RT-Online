import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_content_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_header_beranda.dart';

class PengumumanCardBeranda extends StatelessWidget {
  const PengumumanCardBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ambil instance dari PengumumanController
    final pengumumanController = PengumumanController.to;

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
            child: Column(
              children: [
                // Regular Content
                Obx(
                  () => SizedBox(
                    width: 358.w,
                    height: 509.w,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: pengumumanController.pengumumanList.length,
                      itemBuilder: (context, index) {
                        final pengumuman =
                            pengumumanController.pengumumanList[index];
                        return PengumumanContentBeranda(
                          isLast: index ==
                              pengumumanController.pengumumanList.length - 1,
                          isPinned: index == 0,
                          title: pengumuman['title'] ?? '',
                          date: pengumuman['date'] ?? '',
                          content: pengumuman['content'] ?? '',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          Column(
            children: [
              // Pinned Content
              if (pengumumanController.pengumumanList.isNotEmpty)
                PengumumanContentBeranda(
                  isPinned: true,
                  image: pengumumanController.pengumumanList[0]['image'] ?? '',
                  title: pengumumanController.pengumumanList[0]['title'] ?? '',
                  head: pengumumanController.pengumumanList[0]['head'] ?? '',
                  kategori:
                      pengumumanController.pengumumanList[0]['kategori'] ?? '',
                  date: pengumumanController.pengumumanList[0]['date'] ?? '',
                  content:
                      pengumumanController.pengumumanList[0]['content'] ?? '',
                  dateDetail: pengumumanController.pengumumanList[0]
                          ['date_detail'] ??
                      '',
                  onTap: () => pengumumanController.navigateToDetailPage(0),
                ),

              // Regular Content
              Obx(
                () => SizedBox(
                  width: 358.w,
                  height: 509.w - 116.w,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: pengumumanController.pengumumanList.length - 1,
                    itemBuilder: (context, index) {
                      final pengumuman =
                          pengumumanController.pengumumanList[index + 1];
                      return PengumumanContentBeranda(
                        isLast: index ==
                            pengumumanController.pengumumanList.length - 2,
                        isPinned: false,
                        image: pengumuman['image'] ?? '',
                        title: pengumuman['title'] ?? '',
                        head: pengumuman['head'] ?? '',
                        kategori: pengumuman['kategori'] ?? '',
                        date: pengumuman['date'] ?? '',
                        content: pengumuman['content'] ?? '',
                        dateDetail: pengumuman['date_detail'] ?? '',
                        onTap: () => pengumumanController
                            .navigateToDetailPage(index + 1),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

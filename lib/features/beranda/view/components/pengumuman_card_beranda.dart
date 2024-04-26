import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/beranda/controllers/beranda_controller.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_content_beranda.dart';
import 'package:venturo_core/features/beranda/view/components/pengumuman_header_beranda.dart';

class PengumumanCardBeranda extends StatelessWidget {
  const PengumumanCardBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(PengumumanController.to.listPengumuman);

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

          //
          Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                await PengumumanController.to.getDataPengumuman();
              },
              child: SizedBox(
                width: 358.w,
                height: 509.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: PengumumanController.to.listPengumuman.length,
                  itemBuilder: (context, index) {
                    var pengumuman =
                        PengumumanController.to.listPengumuman[index];
                    return Obx(
                      () => PengumumanContentBeranda(
                        isLast: index ==
                            PengumumanController.to.listPengumuman.length - 1,
                        isPinned: pengumuman['is_pinned'] == 1 ? true : false,
                        image: pengumuman['photo_url'] ?? '',
                        title: pengumuman['title'] ?? '',
                        date: pengumuman['created_at'] ?? '',
                        content: pengumuman['description'] ?? '',
                        isViewed: PengumumanController.to.listIsViewed[index],
                        onTap: () async {
                          PengumumanController.to.detailIsLoading.value = true;

                          PengumumanController.to.navigateToDetailPage(index);
                          PengumumanController.to.listIsViewed[index] = true;
                          await PengumumanController.to
                              .getDetailAnnouncements(pengumuman['id']);

                          PengumumanController.to.detailIsLoading.value = false;
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // // Content Section
          // Column(
          //   children: [
          //     // Pinned Content
          //     if (PengumumanController.to.pengumumanList.isNotEmpty)
          //       PengumumanContentBeranda(
          //         isPinned: true,
          //         image: PengumumanController.to.pengumumanList[0]['image'] ?? '',
          //         title: PengumumanController.to.pengumumanList[0]['title'] ?? '',
          //         head: PengumumanController.to.pengumumanList[0]['head'] ?? '',
          //         kategori:
          //             PengumumanController.to.pengumumanList[0]['kategori'] ?? '',
          //         date: PengumumanController.to.pengumumanList[0]['date'] ?? '',
          //         content:
          //             PengumumanController.to.pengumumanList[0]['content'] ?? '',
          //         dateDetail: PengumumanController.to.pengumumanList[0]
          //                 ['date_detail'] ??
          //             '',
          //         onTap: () => PengumumanController.to.navigateToDetailPage(0),
          //       ),

          //     // Regular Content
          //     Obx(
          //       () => SizedBox(
          //         width: 358.w,
          //         height: 509.w - 116.w,
          //         child: ListView.builder(
          //           padding: EdgeInsets.zero,
          //           itemCount: PengumumanController.to.pengumumanList.length - 1,
          //           itemBuilder: (context, index) {
          //             final pengumuman =
          //                 PengumumanController.to.pengumumanList[index + 1];
          //             return PengumumanContentBeranda(
          //               isLast: index ==
          //                   PengumumanController.to.pengumumanList.length - 2,
          //               isPinned: false,
          //               image: pengumuman['image'] ?? '',
          //               title: pengumuman['title'] ?? '',
          //               head: pengumuman['head'] ?? '',
          //               kategori: pengumuman['kategori'] ?? '',
          //               date: pengumuman['date'] ?? '',
          //               content: pengumuman['content'] ?? '',
          //               dateDetail: pengumuman['date_detail'] ?? '',
          //               onTap: () => PengumumanController.to
          //                   .navigateToDetailPage(index + 1),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

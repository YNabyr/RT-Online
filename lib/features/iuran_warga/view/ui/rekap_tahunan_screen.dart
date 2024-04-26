import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/iuran_warga/controllers/rekap_tahunan_controller.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_rekap_bulanan.dart';
import 'package:venturo_core/features/iuran_warga/view/components/table_rekap_tahunan.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

import '../../../../shared/styles/google_text_style.dart';

class RekapTahunanScreen extends StatelessWidget {
  RekapTahunanScreen({super.key});

  final RekapTahunanController controller = Get.put(RekapTahunanController());

  @override
  Widget build(BuildContext context) {
    var amount = 300000;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            Stack(
              children: [
                // TopBar
                const TopBarIuranWarga(title: "Rekap Tahunan"),

                // Button
                Container(
                  margin: EdgeInsets.only(top: 78.h + safePadding(context)),
                  child: const Center(child: HeaderRekapBulanan(text: "2023")),
                )
              ],
            ),
            12.verticalSpace,

            // Tab
            SizedBox(
              width: 382.w,
              child: Obx(
                () => TabBar(
                  dividerColor: Colors.grey,
                  dividerHeight: 2.h,
                  indicatorWeight: 2.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFF6454F0),
                  onTap: (x) {
                    controller.currentIndex.value = x;
                  },
                  tabs: [
                    Tab(
                      child:
                          buildTab(text: "Blok A", text2: "10 Warga", index: 0),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok B", text2: "20 Warga", index: 1),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok C", text2: "12 Warga", index: 2),
                    ),
                    Tab(
                      child:
                          buildTab(text: "Blok D", text2: "5 Warga", index: 3),
                    ),
                  ],
                ),
              ),
            ),

            12.verticalSpace,

            // Row status
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Terbayar
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF27D18A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                4.horizontalSpace,

                Text(
                  'Terbayar',
                  style: NunitoTextStyle.fw300.copyWith(
                    color: Colors.black,
                    fontSize: 10.sp,
                  ),
                ),

                15.horizontalSpace,

                // Belum terbayar
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD40202),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                4.horizontalSpace,

                Text(
                  'Belum Terbayar',
                  style: NunitoTextStyle.fw300.copyWith(
                    color: Colors.black,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),

            25.verticalSpace,

            Expanded(
              child: SizedBox(
                width: 382.w,
                child: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  children: [
                    TableRekapTahunan(),
                    TableRekapTahunan(),
                    TableRekapTahunan(),
                    TableRekapTahunan(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab({
    required String text,
    required String text2,
    required int index,
  }) {
    return Text(
      text,
      style: NunitoTextStyle.fw700.copyWith(
        color: (controller.currentIndex.value == index)
            ? const Color(0xFF6454F0)
            : Colors.grey,
        fontSize: 16.sp,
      ),
    );
  }
}

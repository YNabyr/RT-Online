import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/iuran_warga/controllers/rekap_bulanan_controller.dart';
import 'package:venturo_core/features/iuran_warga/view/components/bottom_sheet_rekap_bulanan.dart';
import 'package:venturo_core/features/iuran_warga/view/components/button_rekap_bulanan.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_rekap_bulanan.dart';
import 'package:venturo_core/features/iuran_warga/view/components/rekap_bulanan_card.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

import '../../../../shared/styles/google_text_style.dart';

class RekapBulananScreen extends StatelessWidget {
  RekapBulananScreen({super.key});

  final RekapBulananController controller = Get.put(RekapBulananController());

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
                const TopBarIuranWarga(title: "Rekap Bulanan"),

                // Button
                Container(
                  margin: EdgeInsets.only(top: 78.h + safePadding(context)),
                  child:
                      const Center(child: HeaderRekapBulanan(text: "Oktober")),
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

            Expanded(
              child: TabBarView(
                children: <Widget>[
                  // Blok A
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,

                      // List Card
                      Expanded(
                        child: SizedBox(
                          width: 382.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: RekapBulananCard(
                                  amount: 300000,
                                  onTap: () {
                                    // Bottom Sheet
                                    showModalBottomSheet(
                                      scrollControlDisabledMaxHeightRatio:
                                          double.infinity,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const BottomSheetRekapBulanan();
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Blok B
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,

                      // List Card
                      Expanded(
                        child: SizedBox(
                          width: 382.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: RekapBulananCard(
                                  amount: 300000,
                                  onTap: () {
                                    // Bottom Sheet
                                    showModalBottomSheet(
                                      scrollControlDisabledMaxHeightRatio:
                                          double.infinity,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const BottomSheetRekapBulanan();
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Blok C
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,

                      // List Card
                      Expanded(
                        child: SizedBox(
                          width: 382.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: RekapBulananCard(
                                  amount: 300000,
                                  onTap: () {
                                    // Bottom Sheet
                                    showModalBottomSheet(
                                      scrollControlDisabledMaxHeightRatio:
                                          double.infinity,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const BottomSheetRekapBulanan();
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Blok D
                  Column(
                    children: [
                      25.verticalSpace,

                      // Button
                      buildButton(),

                      25.verticalSpace,

                      // List Card
                      Expanded(
                        child: SizedBox(
                          width: 382.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: RekapBulananCard(
                                  isBayar: true,
                                  amount: 300000,
                                  onTap: () {
                                    // Bottom Sheet
                                    showModalBottomSheet(
                                      scrollControlDisabledMaxHeightRatio:
                                          double.infinity,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const BottomSheetRekapBulanan(
                                          isBayar: true,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildButton() {
    return Column(
      children: [
        // Button
        SizedBox(
          width: 382.w,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Button Sudah Terbayar
              ButtonRekapBulanan(
                header: "Sudah Terbayar",
                warga: 7,
                amount: 5000000,
              ),

              // Button Belum Terbayar
              ButtonRekapBulanan(
                header: "Belum Terbayar",
                amount: 1000000,
                warga: 3,
                isBayar: false,
              ),
            ],
          ),
        ),
      ],
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

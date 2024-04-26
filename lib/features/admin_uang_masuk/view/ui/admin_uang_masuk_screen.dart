import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_uang_masuk/constants/admin_uang_masuk_assets_constant.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/carrd_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/topbar_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_detail_pemasukan_screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_tambah_uang_masuk_screen.dart';
import 'package:venturo_core/features/data_blok/view/components/search_bar_admin_data_blok.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_rekap_bulanan.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminUangMasukScreen extends StatelessWidget {
  AdminUangMasukScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminUangMasukAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Stack
            Stack(
              children: [
                // Header
                CustomHeaderAdmin(
                  title: "Uang Masuk",
                  suffixIcon: "assets/fill/Plus-Square.svg",
                  onTap: () {
                    Get.toNamed(Routes.adminTambahUangMasukRoute);
                  },
                ),

                // Button
                Container(
                  margin: EdgeInsets.only(top: 78.h + safePadding(context)),
                  child: const Center(
                      child: TopbarAdminUangMasuk(text: "Oktober")),
                )
              ],
            ),

            25.verticalSpace,

            // Tabbar
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              dividerColor: Colors.grey,
              dividerHeight: 2.w,
              indicatorWeight: 2.w,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xFF6454F0),
              labelColor: const Color(0xFF6454F0),
              unselectedLabelColor: const Color(0xff9597A3),
              tabs: [
                Tab(
                  child: buildTab(text: "Iuran"),
                ),
                Tab(
                  child: buildTab(text: "Lain-lain"),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  // Blok A
                  Column(
                    children: [
                      25.verticalSpace,
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.adminDetailPemasukanRoute);
                                      },
                                      child: const CardAdminUangMasuk(
                                          amount: 10000)),
                                  15.verticalSpace,
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Blok A
                  Column(
                    children: [
                      25.verticalSpace,
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          Routes.adminDetailPemasukanRoute);
                                    },
                                    child: const CardAdminUangMasuk(
                                      amount: 1000000,
                                    ),
                                  ),
                                  15.verticalSpace,
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab({required String text}) {
    return Text(
      text,
      style: NunitoTextStyle.fw700.copyWith(
        fontSize: 16.sp,
      ),
    );
  }
}

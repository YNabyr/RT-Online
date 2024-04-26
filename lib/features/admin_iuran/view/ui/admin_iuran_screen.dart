import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_iuran/constants/admin_iuran_assets_constant.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_iuran/view/components/card_admin_iuran.dart';
import 'package:venturo_core/features/admin_iuran/view/components/search_bar_admin_iuran.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminIuranScreen extends StatelessWidget {
  AdminIuranScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminIuranAssetsConstant();
  var controller = AdminIuranController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: controller.listBlock.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xffeff0f5),
          body: (controller.isLoading.value == true)
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    // Stack
                    Stack(
                      children: [
                        // Header
                        CustomHeaderAdmin(
                          title: "Admin Iuran ",
                          suffixIcon: "assets/outline/Filter.svg",
                          onTap: () {
                            Get.toNamed(Routes.adminKategoriIuranRoute);
                          },
                        ),

                        // Search Bar
                        Container(
                          margin:
                              EdgeInsets.only(top: 78.h + safePadding(context)),
                          child: const Center(child: SearchBarAdminIuran()),
                        ),
                      ],
                    ),

                    25.verticalSpace,

                    // Tabbar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          dividerColor: Colors.grey,
                          dividerHeight: 2.h,
                          indicatorWeight: 2.w,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: const Color(0xFF6454F0),
                          labelColor: const Color(0xFF6454F0),
                          unselectedLabelColor: const Color(0xff9597A3),
                          tabs: [
                            for (var i = 0;
                                i < controller.listBlock.length;
                                i++)
                              Obx(
                                () => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.w),
                                  child: Tab(
                                    child: buildTab(
                                        text:
                                            "Blok ${controller.filteredCitizen[i]['name']}",
                                        warga: controller
                                            .filteredCitizen[i]['list_id']
                                            .length),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    19.verticalSpace,

                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        children: [
                          for (var i = 0; i < controller.listBlock.length; i++)
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller
                                  .filteredCitizen[i]['list_id'].length,
                              itemBuilder: (BuildContext context, int index) {
                                // Init Variable
                                var filteredCitizen =
                                    controller.filteredCitizen[i];
                                var filteredCitizenId =
                                    filteredCitizen['list_citizen'][index];
                                getAttr(String name) {
                                  return controller.getCitizenProperty(
                                      filteredCitizenId,
                                      name: name);
                                }

                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      child: CardAdminIuran(
                                        imgUrl: getAttr('photo_url'),
                                        amount: controller.listIuran
                                                .where((e) =>
                                                    e['id'] ==
                                                    getAttr('dues_id'))
                                                .map((e) => e['nominal_dues'])
                                                .elementAtOrNull(0) ??
                                            0,
                                        badge: filteredCitizen['list_house']
                                            [index],
                                        name: getAttr('name'),
                                        phoneNumber: getAttr('phone_number'),
                                      ),
                                    ),
                                    15.verticalSpace,
                                  ],
                                );
                              },
                            ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Column buildTab({required String text, int? warga}) {
    return Column(
      children: [
        // Text
        Text(
          text,
          style: NunitoTextStyle.fw700.copyWith(
            fontSize: 16.sp,
          ),
        ),

        // jumlah Warga
        Text(
          '${(warga == null) ? 0 : warga} Warga',
          style: NunitoTextStyle.fw500.copyWith(
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_undang_warga/controllers/admin_undang_warga_controller.dart';
import 'package:venturo_core/features/data_blok/constants/data_blok_assets_constant.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/view/components/card_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/components/header_admin_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/components/search_bar_admin_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/ui/admin_tambah_data_rumah_screen.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataBlokScreen extends StatelessWidget {
  DataBlokScreen({Key? key}) : super(key: key);

  final assetsConstant = DataBlokAssetsConstant();

  static const boxShadow = BoxShadow(
    color: Color(0x19000000),
    blurRadius: 8,
    offset: Offset(4, 3),
    spreadRadius: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (DataBlokController.to.isLoading.value == true)
          ? const CircularProgressIndicator()
          : DefaultTabController(
              length: DataBlokController.to.listBlok.length,
              child: Scaffold(
                backgroundColor: const Color(0xffEFF0F5),
                body: Column(
                  children: [
                    // Stack
                    Stack(
                      children: [
                        // Header
                        HeaderAdminDataBlok(
                          title: "Data Blok dan No. Rumah",
                          suffixIcon: "assets/fill/Plus-Square.svg",
                          onTap: () {
                            Get.toNamed(Routes.adminTambahDataRumahRoute);
                          },
                        ),

                        // Search Bar
                        Container(
                          margin:
                              EdgeInsets.only(top: 78.h + safePadding(context)),
                          child: const Center(child: SearchBarAdminDataBlok()),
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
                                i < DataBlokController.to.listBlok.length;
                                i++)
                              Obx(
                                () => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.w),
                                  child: Tab(
                                    child: buildTab(
                                        text:
                                            "Blok ${DataBlokController.to.listBlok[i]['name']}",
                                        warga: DataBlokController
                                            .to
                                            .filteredHouseIds[i]['list_id']
                                            .length),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    19.verticalSpace,

                    Expanded(
                      child: TabBarView(
                        children: [
                          for (var i = 0;
                              i < DataBlokController.to.listBlok.length;
                              i++)
                            Obx(
                              () => ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: DataBlokController
                                    .to.filteredHouseIds[i]["list_id"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Dismissible(
                                    background: Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 24.w),
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFD40202),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          shadows: [boxShadow],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            // icon trash
                                            SvgPicture.asset(
                                              "assets/fill/ic_trash_2.svg",
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn),
                                              height: 24.h,
                                            ),

                                            20.5.horizontalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    onDismissed: (DismissDirection direction) {
                                      try {
                                        DataBlokController.to.deleteHouse(
                                            DataBlokController
                                                    .to.filteredHouseIds[index]
                                                ['list_id'][index]);
                                      } catch (e) {
                                        throw Exception(e);
                                      }
                                    },
                                    key: ValueKey(i),
                                    child: CardDataBlok(
                                      profileImage: DataBlokController
                                          .to.listPenduduk[index]["photo_url"],
                                      profileName: DataBlokController
                                          .to.listPenduduk[index]["name"],
                                      profileBadge: DataBlokController
                                          .to
                                          .filteredHouseIds[i]['list_house']
                                              [index]
                                          .toString(),
                                      houseId: DataBlokController
                                              .to.filteredHouseIds[i]['list_id']
                                          [index],
                                      hasData: DataBlokController.to
                                          .isHouseValid(DataBlokController
                                              .to
                                              .filteredHouseIds[i]['list_id']
                                                  [index]
                                              .toString()),
                                    ),
                                  );
                                },
                              ),
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

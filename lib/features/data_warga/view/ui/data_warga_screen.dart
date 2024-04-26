// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/view/components/card_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/components/header_admin_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/components/search_bar_admin_data_blok.dart';

import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/models/penduduk.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_card.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataWargaScreen extends StatelessWidget {
  DataWargaScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();

  static const boxShadow = BoxShadow(
    color: Color(0x19000000),
    blurRadius: 8,
    offset: Offset(4, 3),
    spreadRadius: 0,
  );
  var controller = DataWargaController.to;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: DataBlokController.to.listBlok.length,
        child: Scaffold(
          backgroundColor: const Color(0xffEFF0F5),
          body: (DataBlokController.to.isLoading.value == true)
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    // Stack
                    Stack(
                      children: [
                        // Header
                        const HeaderAdminDataBlok(
                          title: "Data Warga",
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
                                  return DataWargaCard(
                                    profileImage: DataWargaController
                                        .to.listPenduduk[index]["photo_url"],
                                    profileName: DataWargaController
                                        .to.listPenduduk[index]["name"],
                                    profileBadge: DataBlokController
                                        .to
                                        .filteredHouseIds[i]['list_house']
                                            [index]
                                        .toString(),
                                    houseId: DataBlokController.to
                                        .filteredHouseIds[i]['list_id'][index],
                                    hasData: DataBlokController.to.isHouseValid(
                                        DataBlokController
                                            .to
                                            .filteredHouseIds[i]['list_id']
                                                [index]
                                            .toString()),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (ctx) {
                                          var houseId = DataBlokController
                                                  .to.filteredHouseIds[i]
                                              ['list_id'][index];
                                          return DataWargaBottomsheet(
                                            badge: DataBlokController
                                                .to
                                                .filteredHouseIds[i]
                                                    ['list_house'][index]
                                                .toString(),
                                            image: DataWargaController
                                                .to.listPenduduk
                                                .where((citizen) =>
                                                    citizen['house_id'] ==
                                                    houseId!)
                                                .map((e) => e['photo_url'])
                                                .elementAt(0)
                                                .toString(),
                                            name: DataWargaController
                                                .to.listPenduduk
                                                .where((citizen) =>
                                                    citizen['house_id'] ==
                                                    houseId!)
                                                .map((e) => e['name'])
                                                .elementAt(0)
                                                .toString(),
                                            birth: DataWargaController
                                                .to.listPenduduk
                                                .where((citizen) =>
                                                    citizen['house_id'] ==
                                                    houseId!)
                                                .map((e) => e['date_of_birth'])
                                                .elementAt(0)
                                                .toString(),
                                            phone: DataWargaController
                                                .to.listPenduduk
                                                .where((citizen) =>
                                                    citizen['house_id'] ==
                                                    houseId!)
                                                .map((e) => e['phone_number'])
                                                .elementAt(0)
                                                .toString(),
                                          );
                                        },
                                      );
                                    },
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

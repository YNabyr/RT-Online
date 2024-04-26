import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/informasi/controllers/informasi_controller.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_list.dart';
import 'package:venturo_core/features/informasi/view/components/top_bar_informasi.dart';
import 'package:venturo_core/features/informasi/view/ui/empty_tata_tertib_screen.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

class TataTertibListScreen extends StatelessWidget {
  TataTertibListScreen({super.key});

  var controller = Get.put(InformasiController());

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarInformasi(),

          (isEmpty == false)
              ?
              // Tatib List
              RefreshIndicator(
                  onRefresh: () async {
                    await InformasiController.to.getDataInformasi();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    height: 695.h + safePadding(context),
                    child: Obx(
                      () => ListView.builder(
                        padding: EdgeInsets.only(top: 32.h),
                        itemCount: controller.listInformasi.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            child: TatibList(
                              name: controller.listInformasi[index]
                                      ['categories_name']
                                  .toString(),
                              onTap: () {
                                Get.toNamed(
                                  Routes.tataTertibRoute,
                                  arguments: controller.listInformasi[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    130.verticalSpace,
                    // Empty Tata Tertib
                    const EmptyTataTertibScreen(),
                  ],
                ),
        ],
      ),
    );
  }
}

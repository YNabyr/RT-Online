import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_area/view/components/header_admin_area.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/list_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/searchbar_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_tambah_informasi_screen.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';

import '../../constants/admin_informasi_assets_constant.dart';

class AdminInformasiScreen extends StatelessWidget {
  AdminInformasiScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminInformasiAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: RefreshIndicator(
        onRefresh: () async {
          await AdminInformasiController.to.getDataInformasi();
        },
        displacement: 20.h,
        child: Column(
          children: [
            // Stack
            Stack(
              children: [
                // Header
                HeaderAdminInformasi(
                  title: "Informasi",
                  suffixIcon: "assets/fill/Plus-Square.svg",
                  onTap: () {
                    Get.toNamed(Routes.adminTambahInformasiRoute);
                  },
                ),

                // Search Bar
                Container(
                    margin: EdgeInsets.only(top: 78.h + safePadding(context)),
                    child: const Center(child: SearchBarAdminInformasi()))
              ],
            ),

            25.verticalSpace,

            // List Informasi
            Expanded(
              child: Obx(
                () => (AdminInformasiController.to.isLoading.value == true)
                    ? const Center(child: CircularProgressIndicator())
                    : const ListAdminInformasi(),
              ),
            ),

            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}

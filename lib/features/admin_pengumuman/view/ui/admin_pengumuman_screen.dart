import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_assets_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/empty_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_tambah_pengumuman_screen.dart';

import '../components/header_admin_pengumuman.dart';
import '../components/list_admin_pengumuman.dart';

class AdminPengumumanScreen extends StatelessWidget {
  AdminPengumumanScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminPengumumanAssetsConstant();
  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // header
          HeaderAdminPengumuman(
            title: "Pengumuman",
            suffixIcon: "assets/fill/Plus-Square.svg",
            onTap: () {
              Get.toNamed(Routes.adminTambahPengumumanRoute);
            },
          ),

          // empty atau list pengumuman

          Obx(
            () => (AdminPengumumanController.to.isLoading.value == false)
                ? (isEmpty == true)
                    ? Padding(
                        padding: EdgeInsets.only(top: 108.h),
                        child: const EmptyAdminPengumuman(),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          await AdminPengumumanController.to
                              .getDataPengumuman();
                        },
                        child: Container(
                          height: 805.h,
                          padding: EdgeInsets.only(top: 25.h),
                          child: const ListAdminPengumuman(),
                        ),
                      )
                : Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.4),
                    child: const CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

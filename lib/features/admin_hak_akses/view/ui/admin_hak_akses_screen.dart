import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_hak_akses/constants/admin_hak_akses_assets_constant.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';
import 'package:venturo_core/features/admin_hak_akses/view/components/textfield_admin_hak_akses.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_edit_hak_akses_screen.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_tambah_hak_akses_screen.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminHakAksesScreen extends StatelessWidget {
  AdminHakAksesScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminHakAksesAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              // Header
              CustomHeaderAdmin(
                title: "Hak Akses",
                suffixIcon: "assets/fill/Plus-Square.svg",
                onTap: () {
                  Get.toNamed(Routes.adminTambahHakAksesRoute);
                },
              ),

              25.verticalSpace,

              (AdminHakAksesController.to.isLoading.value == true)
                  ? const CircularProgressIndicator()
                  : const TextFieldAdminHakAkses(
                      border: true,
                      readOnly: true,
                      prefixIcon: "assets/outline/person.svg",
                      suffixIcon: "assets/outline/edit-2.svg",
                      hint: "Super Admin",
                    ),

              20.verticalSpace,

              for (var i = 0;
                  i < AdminHakAksesController.to.listHakAkses.length;
                  i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: TextFieldAdminHakAkses(
                    border: true,
                    readOnly: true,
                    onTapIcDelete: () {
                      AdminHakAksesController.to.deleteHakAkses(
                          AdminHakAksesController.to.listHakAkses[i]['id']);
                    },
                    onTapSuffixIcon: () {
                      Get.toNamed(
                        Routes.adminEditHakAksesRoute,
                        arguments: {
                          "id": AdminHakAksesController.to.listHakAkses[i]['id']
                              .toString(),
                          "name": AdminHakAksesController
                              .to.listHakAkses[i]['name']
                              .toString(),
                          "access": AdminHakAksesController
                              .to.listHakAkses[i]['access']
                              .toString(),
                        },
                      );
                    },
                    prefixIcon: "assets/outline/person.svg",
                    suffixIcon: "assets/outline/edit-2.svg",
                    icDelete: true,
                    hint: AdminHakAksesController.to.listHakAkses[i]['name']
                        .toString(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

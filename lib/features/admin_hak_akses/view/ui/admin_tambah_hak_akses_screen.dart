import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_hak_akses/constants/admin_hak_akses_assets_constant.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';
import 'package:venturo_core/features/admin_hak_akses/view/components/card_admin_hak_akses.dart';
import 'package:venturo_core/features/admin_hak_akses/view/components/textfield_admin_hak_akses.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminTambahHakAksesScreen extends StatelessWidget {
  const AdminTambahHakAksesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffeff0f5),
        body: Column(
          children: [
            // Header
            CustomHeaderAdmin(
              title: "Tambah Hak Akses",
              onTap: () {},
            ),

            25.verticalSpace,

            TextFieldAdminHakAkses(
              label: "Nama Hak Akses",
              hint: "Masukkan Nana Hak Akses",
              readOnly: false,
              controller: AdminHakAksesController.to.textController,
              icPreffix: false,
              hintColor: Colors.grey,
            ),

            25.verticalSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const Divider(
                color: Color(
                  0xffB5B7C4,
                ),
              ),
            ),

            25.verticalSpace,

            // Tabbar
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              dividerColor: Colors.grey,
              dividerHeight: 2.h,
              indicatorWeight: 2.w,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xFF6454F0),
              labelColor: const Color(0xFF6454F0),
              unselectedLabelColor: const Color(0xff9597A3),
              tabs: [
                Tab(
                  child: buildTab(text: "Hak Akses"),
                ),
              ],
            ),

            19.verticalSpace,

            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Obx(
                          () => CardAdminHakAkses(
                            isChecked:
                                AdminHakAksesController.to.selectedAdmin.value,
                            text: "Admin",
                            onChange: (value) {
                              AdminHakAksesController.to.selectedAdmin.value =
                                  value;
                              if (value == true) {
                                AdminHakAksesController.to.selectedWarga.value =
                                    false;
                              }
                            },
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Obx(
                          () => CardAdminHakAkses(
                            isChecked:
                                AdminHakAksesController.to.selectedWarga.value,
                            text: "Warga",
                            onChange: (value) {
                              AdminHakAksesController.to.selectedWarga.value =
                                  value;
                              if (value == true) {
                                AdminHakAksesController.to.selectedAdmin.value =
                                    false;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            15.verticalSpace,

            ButtonGradientAuth(
              text: "Simpan",
              onPressed: () async {
                await AdminHakAksesController.to.postAkses();
              },
            ),

            24.verticalSpace,
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

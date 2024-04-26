import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_general/constants/admin_general_assets_constant.dart';
import 'package:venturo_core/features/admin_general/controllers/admin_general_controller.dart';
import 'package:venturo_core/features/admin_general/view/components/header_admin_general.dart';
import 'package:venturo_core/features/admin_general/view/components/textfield_admin_general.dart';
import 'package:venturo_core/features/admin_general/view/ui/admin_edit_general_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/textfield_admin_pengumuman.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminGeneralScreen extends StatelessWidget {
  AdminGeneralScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminGeneralAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
          child: Obx(
        () => (AdminGeneralController.to.isLoading.value == false)
            ? Column(
                children: <Widget>[
                  // Header
                  HeaderAdminGeneral(
                    title: "General",
                    suffixIcon: "assets/outline/edit.svg",
                    onTap: () {
                      Get.toNamed(
                        Routes.adminEditGeneralRoute,
                        arguments: AdminGeneralController.to.data,
                      );
                    },
                  ),

                  25.verticalSpace,

                  // Title
                  Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informasi Perumahan',
                        style: PoppinsTextStyle.fw600.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  25.verticalSpace,

                  // TextField
                  Obx(
                    () => TextFieldAdminGeneral(
                      label: "Nama Perumahan / Desa",
                      hint: "Masukkan Perumahan",
                      controller: AdminGeneralController
                          .to.controllerEditPerumahan.value,
                      keyboardType: TextInputType.text,
                      readOnly: true,
                    ),
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "RT",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["rt"]
                          .toString(),
                    ),
                    hint: 'Masukkan RT',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "RW",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["rw"]
                          .toString(),
                    ),
                    hint: 'Masukkan RW',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Alamat",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["address"]
                          .toString(),
                    ),
                    hint: 'Masukkan Alamat',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Provinsi",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["province"]
                          .toString(),
                    ),
                    hint: 'Masukkan Provinsi',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Kota / Kabupaten",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["city"]
                          .toString(),
                    ),
                    hint: 'Masukkan Kota',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Kecamatan",
                    controller: TextEditingController(
                      text: AdminGeneralController.to.listGeneral[0]["district"]
                          .toString(),
                    ),
                    hint: 'Masukkan Kecamatan',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Kode pos",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]["post_code"]
                          .toString(),
                    ),
                    hint: 'Masukkan Kode Pos',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Penanggung Jawab",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]["responsible_person"]
                          .toString(),
                    ),
                    hint: 'Masukkan Penanggung Jawab',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "No. Telepon",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]["phone_number"]
                          .toString(),
                    ),
                    hint: 'Masukkan No. Telepon',
                    readOnly: true,
                  ),

                  25.verticalSpace,

                  // Title
                  Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Struktur RT',
                        style: PoppinsTextStyle.fw600.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  25.verticalSpace,

                  // Struktur
                  for (var i = 0;
                      i <
                          AdminGeneralController
                              .to.listGeneral[0]['structure'].length;
                      i++)
                    Column(
                      children: [
                        TextFieldAdminGeneral(
                          label: "Nama",
                          controller: TextEditingController(
                            text: AdminGeneralController
                                .to.listGeneral[0]['structure'][i]['citizen_id']
                                .toString(),
                          ),
                          hint: 'Masukkan Nama',
                          readOnly: true,
                        ),
                        15.verticalSpace,
                        TextFieldAdminGeneral(
                          label: "Jabatan",
                          controller: TextEditingController(
                            text: AdminGeneralController.to.listGeneral[0]
                                ['structure'][i]['position'],
                          ),
                          hint: 'Masukkan Jabatan',
                          readOnly: true,
                        ),
                        15.verticalSpace,
                      ],
                    ),

                  10.verticalSpace,

                  // Title
                  Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'List Akun Bank',
                        style: PoppinsTextStyle.fw600.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  25.verticalSpace,

                  // TextField
                  TextFieldAdminGeneral(
                    label: "Nama Bank",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]['bank']['name']
                          .toString(),
                    ),
                    hint: 'Masukkan Nama Bank',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "No. Rekening",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]['bank']['no_rek']
                          .toString(),
                    ),
                    hint: 'Masukkan No. Rekening',
                    readOnly: true,
                  ),

                  15.verticalSpace,
                  // TextField
                  TextFieldAdminGeneral(
                    label: "Nama Pemilik Rekening",
                    controller: TextEditingController(
                      text: AdminGeneralController
                          .to.listGeneral[0]['bank']['holder_name']
                          .toString(),
                    ),
                    hint: 'Masukkan Nama Pemilik Rekening',
                    readOnly: true,
                  ),

                  25.verticalSpace,
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      )),
    );
  }
}

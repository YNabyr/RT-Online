// ignore_for_file: public_member_api_docs, sort_ructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';

import 'package:venturo_core/features/admin_general/controllers/admin_general_controller.dart';
import 'package:venturo_core/features/admin_general/repositories/admin_general_repository.dart';
import 'package:venturo_core/features/admin_general/view/components/dropdown_admin_general.dart';
import 'package:venturo_core/features/admin_general/view/components/header_admin_general.dart';
import 'package:venturo_core/features/admin_general/view/components/textfield_admin_general.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminEditGeneralScreen extends StatelessWidget {
  AdminEditGeneralScreen({
    Key? key,
  }) : super(key: key);

  final id = Get.arguments['id'].toString();
  final rt = Get.arguments['rt'].toString();
  final rw = Get.arguments['rw'].toString();
  final address = Get.arguments['address'].toString();
  final province = Get.arguments['province'];
  final city = Get.arguments['city'];
  final district = Get.arguments['district'];
  final postCode = Get.arguments['post_code'];
  final responsiblePerson = Get.arguments['responsible_person'].toString();
  final phoneNumber = Get.arguments['phone_number'].toString();
  final bankId = Get.arguments['bank_id'].toString();
  final bankName = Get.arguments['bank_name'].toString();
  final bankNoRek = Get.arguments['bank_no_rek'].toString();
  final bankHolderName = Get.arguments['bank_holder_name'].toString();
  final structureId = Get.arguments['structure_id'].toString();
  final structurePosition = Get.arguments['structure_position'];
  final structureCitizenId = Get.arguments['structure_citizen_id'];

  @override
  Widget build(BuildContext context) {
    AdminGeneralController.to.controllerEditPerumahan.value.text = id;
    AdminGeneralController.to.controllerEditRT.value.text = rt;
    AdminGeneralController.to.controllerEditRW.value.text = rw;
    AdminGeneralController.to.controllerEditAlamat.value.text = address;
    // AdminGeneralController.to.selectedProvince.value = province;
    // AdminGeneralController.to.selectedCity.value = city;
    // AdminGeneralController.to.selectedDistrict.value = district;
    // AdminGeneralController.to.selectedKodePos.value = postCode;
    AdminGeneralController.to.controllerEditPenanggungJawab.value.text =
        responsiblePerson;
    AdminGeneralController.to.controllerEditNoTelepon.value.text = phoneNumber;
    AdminGeneralController.to.controllerEditNamaBank.value.text = bankName;
    AdminGeneralController.to.controllerEditNoRekening.value.text = bankNoRek;
    AdminGeneralController.to.controllerEditNamaPemilik.value.text =
        bankHolderName;

    for (var i = 0; i < 4; i++) {
      AdminGeneralController.to.listControllerEditNama[i].text =
          structureCitizenId[i];
      AdminGeneralController.to.listControllerEditJabatan[i].text =
          structurePosition[i];
    }

    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderAdminGeneral(
              title: "General",
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
            TextFieldAdminGeneral(
              label: "Nama Perumahan / Desa",
              hint: "Masukkan Perumahan",
              controller:
                  AdminGeneralController.to.controllerEditPerumahan.value,
              isEdit: true,
            ),

            15.verticalSpace,
            // TextField
            SizedBox(
              width: 382.w,
              child: Row(
                children: [
                  TextFieldAdminGeneral(
                    label: "RT",
                    hint: "Masukkan RT",
                    controller:
                        AdminGeneralController.to.controllerEditRT.value,
                    isEdit: true,
                    keyboardType: TextInputType.number,
                    width: 183.5.w,
                  ),

                  15.horizontalSpace,

                  // TextField
                  TextFieldAdminGeneral(
                    label: "RW",
                    controller:
                        AdminGeneralController.to.controllerEditRW.value,
                    hint: "Masukkan RW",
                    isEdit: true,
                    width: 183.5.w,
                  ),
                ],
              ),
            ),

            15.verticalSpace,
            // TextField
            TextFieldAdminGeneral(
              label: "Alamat",
              controller: AdminGeneralController.to.controllerEditAlamat.value,
              hint: "Masukkan Alamat",
              isEdit: true,
            ),

            15.verticalSpace,
            // TextField
            Obx(
              () => DropdownAdminGeneral(
                label: "Provinsi",
                hint: "Pilih Provinsi",
                value: (AdminGeneralController.to.selectedProvince.value == '')
                    ? null
                    : AdminGeneralController.to.selectedProvince.value,
                onChanged: (value) async {
                  AdminGeneralController.to.selectedProvince.value = value!;
                  AdminGeneralController.to.selectedProvinceId.value =
                      AdminGeneralController.to.listProvince
                          .where((e) => e['name'] == value)
                          .map((e) => e['id'])
                          .toList()
                          .elementAt(0)
                          .toString();

                  print(AdminGeneralController.to.selectedProvinceId.value);
                  AdminGeneralController.to.selectedCity.value = '';

                  await AdminGeneralController.to.getCity();
                },
                onMenuStateChange: (onChange) {},
                dropdownItems: AdminGeneralController.to.listProvince
                    .map<String>((element) => element['name'])
                    .toList(),
              ),
            ),

            15.verticalSpace,
            // TextField
            Obx(
              () => DropdownAdminGeneral(
                label: "Kota / Kabupaten",
                hint: "Pilih Kota",
                value: (AdminGeneralController.to.selectedCity.value == '')
                    ? null
                    : AdminGeneralController.to.selectedCity.value,
                onChanged: (value) async {
                  AdminGeneralController.to.selectedCity.value = value!;
                  AdminGeneralController.to.selectedCityId.value =
                      AdminGeneralController.to.listCity
                          .where((e) => e['name'] == value)
                          .map((e) => e['id'])
                          .elementAt(0);
                  AdminGeneralController.to.selectedDistrict.value = '';
                  await AdminGeneralController.to.getDistrict();
                },
                onMenuStateChange: (onChange) {},
                dropdownItems: AdminGeneralController.to.listCity
                    .map<String>((element) => element['name'])
                    .toList(),
              ),
            ),

            15.verticalSpace,
            // TextField
            Obx(
              () => DropdownAdminGeneral(
                label: "Kecamatan",
                hint: "Pilih Kecamatan",
                value: (AdminGeneralController.to.selectedDistrict.value == '')
                    ? null
                    : AdminGeneralController.to.selectedDistrict.value,
                onChanged: (value) async {
                  AdminGeneralController.to.selectedDistrict.value = value!;
                  AdminGeneralController.to.selectedDistrictId.value =
                      AdminGeneralController.to.listDistrict
                          .where((e) => e['name'] == value)
                          .map((e) => e['regency_id'])
                          .elementAt(0);
                  AdminGeneralController.to.selectedKodePos.value = '';
                  await AdminGeneralController.to.getKodePos();
                },
                onMenuStateChange: (onChange) {},
                dropdownItems: AdminGeneralController.to.listDistrict
                    .map<String>((element) => element['name'])
                    .toList(),
              ),
            ),

            15.verticalSpace,
            // TextField
            Obx(
              () => DropdownAdminGeneral(
                label: "Kode pos",
                hint: "Pilih Kode Pos",
                value: (AdminGeneralController.to.selectedKodePos.value == '')
                    ? null
                    : AdminGeneralController.to.selectedKodePos.value,
                onChanged: (value) async {
                  AdminGeneralController.to.selectedKodePos.value = value!;
                },
                onMenuStateChange: (onChange) {},
                dropdownItems: AdminGeneralController.to.listKodePos
                    .map<String>((element) => element)
                    .toSet()
                    .toList(),
              ),
            ),

            15.verticalSpace,
            // TextField
            TextFieldAdminGeneral(
              label: "Penanggung Jawab",
              controller:
                  AdminGeneralController.to.controllerEditPenanggungJawab.value,
              hint: "Masukkan Penanggung Jawab",
              isEdit: true,
            ),

            15.verticalSpace,
            // TextField
            TextFieldAdminGeneral(
              label: "No. Telepon",
              controller:
                  AdminGeneralController.to.controllerEditNoTelepon.value,
              hint: "Masukkan No. Telepon",
              isEdit: true,
            ),

            25.verticalSpace,

            // Title
            SizedBox(
              width: 382.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Struktur RT',
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 20.sp,
                      ),
                    ),

                    // Button tambah
                    GestureDetector(
                      child: Container(
                        width: 30.w,
                        height: 30.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 6.w),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.90, -0.44),
                            end: Alignment(-0.9, 0.44),
                            colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 15.w),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),

            25.verticalSpace,

            for (var i = 0;
                i <
                    AdminGeneralController
                        .to.listGeneral[0]['structure'].length;
                i++)
              Column(
                children: [
                  TextFieldAdminGeneral(
                    label: "Nama",
                    isEdit: true,
                    controller:
                        AdminGeneralController.to.listControllerEditNama[i],
                    hint: 'Masukkan Nama',
                  ),
                  15.verticalSpace,
                  TextFieldAdminGeneral(
                    label: "Jabatan",
                    isEdit: true,
                    controller:
                        AdminGeneralController.to.listControllerEditJabatan[i],
                    hint: 'Masukkan Jabatan',
                  ),
                  15.verticalSpace,
                ],
              ),

            // // TextField
            // TextFieldAdminGeneral(
            //   label: "Nama",
            //   controller: AdminGeneralController.to.controllerEditNama.value,
            //   hint: "Masukkan Nama",
            //   isEdit: true,
            //   close: true,
            // ),

            // 15.verticalSpace,
            // // TextField
            // TextFieldAdminGeneral(
            //   label: "Jabatan",
            //   controller: AdminGeneralController.to.controllerEditJabatan.value,
            //   hint: "Masukkan Jabatan",
            //   isEdit: true,
            // ),

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
            DropdownAdminGeneral(
              label: "Nama Bank",
              hint: "Pilih Bank",
              onChanged: (value) {},
              dropdownItems: [bankName, "BCA"],
            ),

            15.verticalSpace,
            // TextField
            TextFieldAdminGeneral(
              label: "No. Rekening",
              controller:
                  AdminGeneralController.to.controllerEditNoRekening.value,
              hint: "Masukkan No. Rekening",
              isEdit: true,
            ),

            15.verticalSpace,
            // TextField
            TextFieldAdminGeneral(
              label: "Nama Pemilik Rekening",
              hint: "Masukkan Nama Pemilik Rekening",
              controller:
                  AdminGeneralController.to.controllerEditNamaPemilik.value,
              isEdit: true,
            ),

            25.verticalSpace,

            ButtonGradientAuth(
              text: "Simpan",
              onPressed: () async {
                await AdminGeneralController.to.editGeneral();
              },
            ),
            25.verticalSpace,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_undang_warga/constants/admin_undang_warga_assets_constant.dart';
import 'package:venturo_core/features/admin_undang_warga/controllers/admin_undang_warga_controller.dart';
import 'package:venturo_core/features/admin_undang_warga/view/components/card_profile_undang_warga.dart';
import 'package:venturo_core/features/admin_undang_warga/view/components/dropdown_admin_undang_warga.dart';
import 'package:venturo_core/features/admin_undang_warga/view/components/header_admin_undang_warga.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/pembayaran/view/components/checkbox_pembayaran_warga.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminUndangWargaScreen extends StatelessWidget {
  AdminUndangWargaScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminUndangWargaAssetsConstant();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            // header
            const HeaderAdminUndangWarga(title: "Profile"),

            32.verticalSpace,

            // Image
            Obx(
              () => CardProfileUndangwarga(
                isEdit: true,
                image: AdminUndangWargaController.to.pickedImage.value,
                onTap: () {
                  AdminUndangWargaController.to
                      .showImagePickerBottomSheet(context);
                },
              ),
            ),

            25.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "Nama",
              hint: "Masukkan Nama",
              controller: AdminUndangWargaController.to.nameController,
            ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "NIK",
              hint: "Masukkan NIK",
              icon: "assets/outline/image.svg",
              controller: AdminUndangWargaController.to.nikController,
              textInputType: TextInputType.number,
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "NIK",
                  hint: "Masukkan NIK",
                  textInputType: TextInputType.number,
                  text: "Foto KTP",
                );
              },
            ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "No. KK",
              hint: "Masukkan KK",
              icon: "assets/outline/image.svg",
              controller: AdminUndangWargaController.to.nokkController,
              textInputType: TextInputType.number,
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "NIK",
                  hint: "Masukkan NIK",
                  textInputType: TextInputType.number,
                  text: "Foto KTP",
                );
              },
            ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "No. Handphone",
              hint: "Masukkan No. Handphone",
              controller: AdminUndangWargaController.to.tlpController,
              textInputType: TextInputType.phone,
            ),

            20.verticalSpace,

            // Dropdown Blok - Nomor Rumah
            Obx(
              () => DropdownAdminUndangWarga(
                label: "Blok - Nomor Rumah",
                hint: "Pilih Blok - Nomor Rumah",
                value: (AdminUndangWargaController.to.selectedBlok.value == '')
                    ? null
                    : AdminUndangWargaController.to.selectedBlok.value,
                onMenuStateChange: (onChange) {
                  AdminUndangWargaController.to.blokTapped.value = onChange;
                },
                icon: AdminUndangWargaController.to
                    .switchIcon(AdminUndangWargaController.to.blokTapped.value),
                dropdownItems: DataBlokController.to.houseInfoList
                    .map<String>(
                      (house) {
                        return house['house'] ?? '';
                      },
                    )
                    .where((house) => house.isNotEmpty)
                    .toSet()
                    .toList(),
                onChanged: (value) {
                  AdminUndangWargaController.to.selectedBlok.value = value!;
                  AdminUndangWargaController.to.selectedBlokId.value =
                      DataBlokController.to.houseInfoList
                          .where((e) => e['house'] == value)
                          .map((e) => e['id'])
                          .elementAt(0)
                          .toString();

                  print(AdminUndangWargaController.to.selectedBlokId.value);
                },
              ),
            ),

            20.verticalSpace,

            // Dropdown Iuran Warga
            Obx(
              () => DropdownAdminUndangWarga(
                label: "Iuran Warga",
                hint: "Pilih Iuran Warga",
                value: (AdminUndangWargaController.to.selectedIuran.value == '')
                    ? null
                    : AdminUndangWargaController.to.selectedIuran.value,
                onMenuStateChange: (onChange) {
                  AdminUndangWargaController.to.iuranTapped.value = onChange;
                },
                icon: AdminUndangWargaController.to.switchIcon(
                    AdminUndangWargaController.to.iuranTapped.value),
                dropdownItems: AdminIuranController.to.listIuran
                    .map<String>(
                        (element) => element["nominal_dues"].toString())
                    .toSet()
                    .toList(),
                onChanged: (value) {
                  AdminUndangWargaController.to.selectedIuran.value = value!;

                  AdminUndangWargaController.to.selectedIuranId.value =
                      AdminIuranController.to.listIuran
                          .where((e) => e['nominal_dues'].toString() == value)
                          .map((e) => e['id'])
                          .elementAt(0)
                          .toString();

                  print(AdminUndangWargaController.to.selectedIuranId.value);
                },
              ),
            ),

            20.verticalSpace,

            Obx(
              () => DropdownAdminUndangWarga(
                label: "Jenis Kelamin",
                hint: "Pilih Jenis Kelamin",
                value:
                    (AdminUndangWargaController.to.selectedGender.value == '')
                        ? null
                        : AdminUndangWargaController.to.selectedGender.value,
                dropdownItems: const ["Laki-laki", "Perempuan"],
                onChanged: (value) {
                  AdminUndangWargaController.to.selectedGender.value = value!;
                },
                onMenuStateChange: (onChange) {},
              ),
            ),

            // // Text Field
            // TextFieldEditProfile(
            //   label: "Jenis Kelamin",
            //   hint: "Masukkan Jenis Kelamin",
            //   controller: AdminUndangWargaController.to.genderController,
            //   textInputType: TextInputType.text,
            // ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "Tempat, Tanggal Lahir",
              hint: "Masukkan Tempat, Tanggal Lahir",
              controller: AdminUndangWargaController.to.tempatTglController,
            ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "Agama",
              hint: "Masukkan Agama",
              controller: AdminUndangWargaController.to.agamaController,
            ),

            20.verticalSpace,

            // Text Field
            TextFieldEditProfile(
              label: "Password",
              hint: "Masukkan Password",
              controller: AdminUndangWargaController.to.passwordController,
              isObscure: true,
              textInputType: TextInputType.visiblePassword,
            ),

            20.verticalSpace,

            Obx(
              () => DropdownAdminUndangWarga(
                label: "Hak Akses",
                hint: "Pilih Hak Akses",
                dropdownHeight: 125.h,
                onMenuStateChange: (onChange) {
                  AdminUndangWargaController.to.hakTapped.value = onChange;
                },
                value:
                    (AdminUndangWargaController.to.selectedHakAkses.value == '')
                        ? null
                        : AdminUndangWargaController.to.selectedHakAkses.value,
                icon: AdminUndangWargaController.to
                    .switchIcon(AdminUndangWargaController.to.hakTapped.value),
                dropdownItems: AdminUndangWargaController
                    .to.controllerHakAkses.listHakAkses
                    .map((element) => element['name'].toString())
                    .toSet()
                    .toList(),
                onChanged: (value) {
                  AdminUndangWargaController.to.selectedHakAkses.value = value!;

                  AdminUndangWargaController.to.selectedHakAksesId.value =
                      AdminHakAksesController.to.listHakAkses
                          .where((e) => e['name'].toString() == value)
                          .map((e) => e['id'])
                          .elementAt(0)
                          .toString();

                  print(AdminUndangWargaController.to.selectedHakAksesId.value);
                },
              ),
            ),

            // Obx(() => (AdminUndangWargaController.to.isTapped.value == false)
            //     ? 0.verticalSpace
            //     : 300.verticalSpace),

            20.verticalSpace,

            // Row
            Row(
              children: [
                24.horizontalSpace,
                CheckboxPembayaran(
                  isChecked: AdminUndangWargaController.to.isInvited.value,
                  onChange: (value) {
                    AdminUndangWargaController.to.isInvited.value = value;
                    value = !value;
                  },
                ),
                10.horizontalSpace,
                Text(
                  'Kirim Invitation',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),

            20.verticalSpace,

            // button
            ButtonGradientAuth(
              text: "Simpan",
              onPressed: () async {
                await AdminUndangWargaController.to.postData();
              },
            ),

            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottomSheetEdit(
    BuildContext context, {
    required String label,
    required String hint,
    required TextInputType textInputType,
    String? text,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: BottomSheetEditProfile(
            height: 300.w,
            isTextFieldOn: false,
            label: label,
            hint: "Masukkan No. KK",
            textInputType: TextInputType.number,
            icon: "assets/images/ic_edit.png",
            text: (text != null) ? text : "null",
          ),
        );
      },
    );
  }
}

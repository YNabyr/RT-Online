import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_undang_warga/view/components/dropdown_admin_undang_warga.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/profile/controllers/profile_controller.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarProfile(title: "Profile"),

            32.verticalSpace,

            // Profile Card
            ProfileCard(
              isEdit: true,
              photo: args['photo_url'],
              name: args['name'],
              badge: ProfileController.to.badge.value,
              perumahan: args['date_of_birth'],
              onTap: () {
                ProfileController.to.showImagePickerBottomSheet(context);
              },
            ),

            43.verticalSpace,

            // TextField
            // No. KK
            TextFieldEditProfile(
              controller: ProfileController.to.controllerNoKK.value,
              label: "No. KK",
              hint: "Masukkan No. KK",
              textInputType: TextInputType.number,
              icon: "assets/outline/image.svg",
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "No. KK",
                  hint: "Masukkan No. KK",
                  textInputType: TextInputType.number,
                  text: "Foto KK",
                );
              },
            ),

            20.verticalSpace,

            // NIK
            TextFieldEditProfile(
              controller: ProfileController.to.controllerNoNIK.value,
              hint: "Masukkan NIK",
              icon: "assets/outline/image.svg",
              label: "NIK",
              textInputType: TextInputType.number,
              onTap: () {
                showBottomSheetEdit(
                  context,
                  label: "NIK",
                  hint: "Masukkan NIK",
                  textInputType: TextInputType.number,
                  text: "Foto NIK",
                );
              },
            ),

            20.verticalSpace,

            // Pekerjaan
            TextFieldEditProfile(
              controller: ProfileController.to.controllerPekerjaan.value,
              hint: "Masukkan Pekerjaan",
              icon: "assets/outline/edit.svg",
              label: "Pekerjaan",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // Tempat tanggal lahir
            TextFieldEditProfile(
              controller: ProfileController.to.controllerTanggalLahir.value,
              hint: 'Masukkan Tempat, Tanggal Lahir',
              icon: "assets/outline/calendar.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              label: "Tempat, Tanggal Lahir",
              textInputType: TextInputType.text,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null) {
                  ProfileController.to.controllerTanggalLahir.value.text =
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                }
              },
            ),

            20.verticalSpace,

            // Jenis Kelamin
            Obx(
              () => DropdownAdminUndangWarga(
                label: "Jenis Kelamin",
                hint: "Pilih Jenis Kelamin",
                value: (ProfileController.to.selectedGender.value == '')
                    ? null
                    : ProfileController.to.selectedGender.value,
                dropdownItems: const ["Laki-laki", "Perempuan"],
                onChanged: (value) {
                  ProfileController.to.selectedGender.value = value!;
                },
                onMenuStateChange: (onChange) {},
              ),
            ),

            20.verticalSpace,

            // Agama
            TextFieldEditProfile(
              controller: ProfileController.to.controllerAgama.value,
              hint: "Masukkan Agama",
              icon: "assets/outline/edit.svg",
              label: "Agama",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // No. Handphone
            TextFieldEditProfile(
              controller: ProfileController.to.controllerNoHandphone.value,
              hint: "Masukkan No. Handphone",
              icon: "assets/outline/edit.svg",
              label: "No. Handphone",
              textInputType: TextInputType.phone,
            ),

            40.verticalSpace,

            // Button Simpan
            ButtonGradientProfile(
              text: "Simpan",
              onPressed: () async {
                await ProfileController.to.editProfile();
                await ProfileController.to.getUserInfo();
                Get.toNamed(Routes.dashboardRoute);
              },
            ),

            25.verticalSpace
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
        double sheetHeight = 370.w;
        return SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom + sheetHeight,
          child: BottomSheetEditProfile(
            isTextFieldOn: true,
            label: label,
            hint: "Masukkan No. KK",
            textInputType: TextInputType.number,
            icon: "assets/outline/edit.svg",
            text: (text != null) ? text : "null",
          ),
        );
      },
    );
  }
}

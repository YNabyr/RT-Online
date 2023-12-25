import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/profile/view/components/bottom_sheet_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/drop_down_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo Controller
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Topbar
            const TopBarProfile(title: "Profile"),

            32.verticalSpace,

            // Profile Card
            const ProfileCard(
              isEdit: true,
            ),

            43.verticalSpace,

            // TextField
            // No. KK
            TextFieldEditProfile(
              label: "No. KK",
              hint: "Masukkan No. KK",
              textInputType: TextInputType.number,
              icon: "assets/images/ic_image.png",
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
              hint: "Masukkan NIK",
              icon: "assets/images/ic_image.png",
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
            const TextFieldEditProfile(
              hint: "Masukkan Pekerjaan",
              icon: "assets/images/ic_edit.png",
              label: "Pekerjaan",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // Tempat tanggal lahir
            TextFieldEditProfile(
              controller: controller,
              hint: 'Masukkan Tempat, Tanggal Lahir',
              icon: "assets/images/ic_calendar.png",
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
                  controller.text =
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                }
              },
            ),

            20.verticalSpace,

            // Jenis Kelamin
            DropDownEditProfile(
              hint: "Masukkan Jenis Kelamin",
              label: "Jenis Kelamin",
              icon: "assets/images/ic_arrow_ios_down.png",
              textInputType: TextInputType.text,
              controller: controller2,
            ),

            20.verticalSpace,

            // Agama
            const TextFieldEditProfile(
              hint: "Masukkan Agama",
              icon: "assets/images/ic_edit.png",
              label: "Agama",
              textInputType: TextInputType.text,
            ),

            20.verticalSpace,

            // No. Handphone
            const TextFieldEditProfile(
              hint: "Masukkan No. Handphone",
              icon: "assets/images/ic_edit.png",
              label: "No. Handphone",
              textInputType: TextInputType.phone,
            ),

            40.verticalSpace,

            // Button Simpan
            ButtonGradientProfile(
              text: "Simpan",
              onPressed: () {},
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

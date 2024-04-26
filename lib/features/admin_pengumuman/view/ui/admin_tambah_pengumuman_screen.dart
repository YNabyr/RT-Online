import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_assets_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_tambah_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/empty_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/textfield_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';

import '../components/header_admin_pengumuman.dart';

class AdminTambahPengumumanScreen extends StatelessWidget {
  AdminTambahPengumumanScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminPengumumanAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); // Menutup keyboard ketika menyentuh area selain TextField
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffeff0f5),
        body: Obx(
          () => (AdminTambahPengumumanController.to.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Header
                    const HeaderAdminPengumuman(title: "Tambah Pengumuman"),

                    25.verticalSpace,

                    // textfield
                    Obx(
                      () => TextFieldAdminPengumuman(
                        controller: AdminTambahPengumumanController
                            .to.controllerTitle.value,
                        label: "Judul",
                        hint: "Masukkan judul pengumuman",
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    15.verticalSpace,

                    // field desc
                    Obx(
                      () => TextFieldAdminPengumuman(
                        controller: AdminTambahPengumumanController
                            .to.controllerDeskripsi.value,
                        label: "Isi Informasi",
                        hint: "Masukkan isi informasi",
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: null,
                      ),
                    ),

                    15.verticalSpace,

                    // Upload
                    UploadGambarCustom(
                      label: 'Upload Gambar',
                      imagePathObx:
                          AdminTambahPengumumanController.to.pickedImageString,
                      isObx: true,
                      onTap: () async {
                        AdminTambahPengumumanController.to
                            .pickImage(ImageSource.gallery);
                      },
                    ),

                    Expanded(child: Container()),

                    // Button Simpan
                    ButtonGradientAuth(
                      text: "Simpan",
                      onPressed: () async {
                        try {
                          AdminTambahPengumumanController.to.isLoading.value =
                              true;

                          await AdminTambahPengumumanController.to
                              .postPengumuman();
                          AdminPengumumanController.to.getDataPengumuman();
                          print(AdminPengumumanController.to.listPengumuman);

                          AdminTambahPengumumanController.to.isLoading.value =
                              false;
                        } catch (e) {
                          AdminTambahPengumumanController.to.isLoading.value =
                              false;
                          throw Exception(e);
                        }
                      },
                    ),

                    24.verticalSpace,
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_assets_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_edit_pungumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/empty_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/textfield_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/beranda/controllers/pengumuman_controller.dart';

import '../components/header_admin_pengumuman.dart';

class AdminEditPengumumanScreen extends StatelessWidget {
  AdminEditPengumumanScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminPengumumanAssetsConstant();

  // Argument
  var id = Get.arguments['id'];
  var title = Get.arguments['title'];
  var description = Get.arguments['description'];
  var photo = Get.arguments['photo'];
  var isPinned = Get.arguments['is_pinned'];

  var controllerTitle = AdminEditPengumumanController.to.controllerTitle;

  @override
  Widget build(BuildContext context) {
    // Inisialisasi value
    AdminEditPengumumanController.to.controllerTitle.value.text = title;
    AdminEditPengumumanController.to.controllerDeskripsi.value.text =
        description;
    AdminEditPengumumanController.to.pickedImageString.value = photo;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); // Menutup keyboard ketika menyentuh area selain TextField
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffeff0f5),
        body: Obx(
          () => (AdminEditPengumumanController.to.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Header
                    const HeaderAdminPengumuman(title: "Edit Pengumuman"),

                    25.verticalSpace,

                    // textfield
                    Obx(
                      () => TextFieldAdminPengumuman(
                        controller: AdminEditPengumumanController
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
                        controller: AdminEditPengumumanController
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
                          AdminEditPengumumanController.to.pickedImageString,
                      isObx: true,
                      onTap: () async {
                        AdminEditPengumumanController.to
                            .pickImage(ImageSource.gallery);
                      },
                    ),

                    Expanded(child: Container()),

                    // Button Simpan
                    ButtonGradientAuth(
                      text: "Simpan",
                      onPressed: () async {
                        try {
                          AdminEditPengumumanController.to.isLoading.value =
                              true;

                          await AdminEditPengumumanController.to
                              .editPengumuman(id, isPinned);
                          await AdminPengumumanController.to
                              .getDataPengumuman();
                          await PengumumanController.to.getDataPengumuman();

                          AdminEditPengumumanController.to.isLoading.value =
                              false;
                        } catch (e) {
                          AdminEditPengumumanController.to.isLoading.value =
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_edit_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/bottomsheet_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/dropdown_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_assets_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/empty_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/textfield_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';

class AdminEditInformasiScreen extends StatelessWidget {
  AdminEditInformasiScreen({Key? key}) : super(key: key);

  var id = Get.arguments['id'];
  var description = Get.arguments['description'];
  var categoriesId = Get.arguments['categories_id'];
  var categoriesName = Get.arguments['categories_name'];
  var photo = Get.arguments['photo'];

  final assetsConstant = AdminPengumumanAssetsConstant();
  @override
  Widget build(BuildContext context) {
    // Inisialisasi value
    AdminEditInformasiController.to.controllerDeskripsi.value.text =
        description;
    AdminEditInformasiController.to.pickedImageString.value = photo;

    categoriesName ??= '';
    AdminTambahInformasiController.to.selectedCategories.value = categoriesName;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const HeaderAdminInformasi(title: "Edit Informasi"),

          25.verticalSpace,

          // dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Dropdown
              DropdownAdminInformasi(
                label: "Kategori",
                hintText: "Pilih Kategori Pengumuman",
                value:
                    AdminTambahInformasiController.to.selectedCategories.value,
              ),

              10.horizontalSpace,

              // Button Edit
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    scrollControlDisabledMaxHeightRatio: double.infinity,
                    builder: (BuildContext context) {
                      return const BottomSheetAdminInformasi();
                    },
                  );
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
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
              )
            ],
          ),

          15.verticalSpace,

          // field desc
          TextFieldAdminPengumuman(
            controller:
                AdminEditInformasiController.to.controllerDeskripsi.value,
            label: "Isi Informasi",
            hint: "Masukkan isi informasi",
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: null,
          ),

          15.verticalSpace,

          // Upload
          UploadGambarCustom(
            imagePathObx: AdminEditInformasiController.to.pickedImageString,
            isObx: true,
            onTap: () async {
              AdminEditInformasiController.to.pickImage(ImageSource.gallery);
            },
          ),

          Expanded(child: Container()),

          // Button Simpan
          ButtonGradientAuth(
              text: "Simpan",
              onPressed: () {
                AdminEditInformasiController.to.editInformasi(id);
              }),

          24.verticalSpace,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

class AdminTambahInformasiScreen extends StatelessWidget {
  AdminTambahInformasiScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminPengumumanAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Obx(
        () => (AdminTambahInformasiController.to.isLoading.value == true)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Header
                  const HeaderAdminInformasi(title: "Tambah Informasi"),

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
                        value: AdminTambahInformasiController
                            .to.selectedCategories.value,
                      ),

                      10.horizontalSpace,

                      // Button tambah
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            scrollControlDisabledMaxHeightRatio:
                                double.infinity,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: const BottomSheetAdminInformasi(),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 40.w,
                          height: 42.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 6.h),
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
                          child:
                              Icon(Icons.add, color: Colors.white, size: 15.w),
                        ),
                      )
                    ],
                  ),

                  15.verticalSpace,

                  // Field Deskripsi
                  TextFieldAdminPengumuman(
                    controller: AdminTambahInformasiController
                        .to.controllerDeskripsi.value,
                    label: "Isi Informasi",
                    hint: "Masukkan isi informasi",
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: null,
                  ),

                  15.verticalSpace,

                  // Upload
                  UploadGambarCustom(
                    imagePathObx:
                        AdminTambahInformasiController.to.pickedImageString,
                    isObx: true,
                    onTap: () async {
                      AdminTambahInformasiController.to
                          .pickImage(ImageSource.gallery);
                    },
                  ),

                  Expanded(child: Container()),

                  // Button Simpan
                  ButtonGradientAuth(
                    text: "Simpan",
                    onPressed: () async {
                      await AdminTambahInformasiController.to.postInformasi();
                      await AdminInformasiController.to.getDataInformasi();
                    },
                  ),

                  24.verticalSpace,
                ],
              ),
      ),
    );
  }
}

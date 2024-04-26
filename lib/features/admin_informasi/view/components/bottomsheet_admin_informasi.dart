import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_edit_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_kategori_informasi_controller.dart';
import 'package:venturo_core/features/admin_informasi/view/components/text_field_tambah_kategori.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/shared/models/kategori.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetAdminInformasi extends StatefulWidget {
  const BottomSheetAdminInformasi({super.key});

  @override
  State<BottomSheetAdminInformasi> createState() =>
      _BottomSheetAdminInformasiState();
}

class _BottomSheetAdminInformasiState extends State<BottomSheetAdminInformasi> {
  int tambahBlok = 1;

  // var listKategoriName = AdminTambahInformasiController.to.listKategoriInformasi
  //     .map((value) => value['name'])
  //     .toList()
  //     .obs;

  // var listKategori = AdminTambahInformasiController.to.listKategoriInformasi
  //     .map((value) => value)
  //     .toList()
  //     .obs;

  // var listKategoriId = AdminTambahInformasiController.to.listKategoriInformasi
  //     .map((value) => value['id'])
  //     .toList()
  //     .obs;

  var addListKategori = [];

  // List untuk menyimpan controller dari setiap TextField
  List<TextEditingController> textEditingControllerList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 12.h, left: 24.w, right: 24.w, bottom: 24.h),
      child: Column(
        children: [
          // bar
          Container(
            width: 100.w,
            height: 5.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          15.verticalSpace,

          // Row
          Row(
            children: [
              // Button tambah
              InkWell(
                onTap: () {
                  setState(() {
                    addListKategori.add('');
                    textEditingControllerList.add(TextEditingController());
                  });
                },
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
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
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15.w,
                  ),
                ),
              ),

              (30 + 48).horizontalSpace,

              // Text
              Text(
                'Tambah Kategori',
                textAlign: TextAlign.center,
                style: PoppinsTextStyle.fw600.copyWith(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),

          15.verticalSpace,

          Obx(
            () => (AdminTambahKategoriInformasiController.to.isLoading.value ==
                    true)
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      // TextField data API

                      for (var i = 0;
                          i <
                              AdminTambahInformasiController
                                  .to.listKategoriNameInformasi.length;
                          i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: TextFieldTambahKategori(
                            key: ValueKey(AdminTambahInformasiController
                                .to.listKategoriNameInformasi[i]),
                            suffixIcon: Icons.close_rounded,
                            controller: (AdminTambahInformasiController.to
                                    .listKategoriNameInformasi[i]!.isNotEmpty)
                                ? AdminTambahInformasiController
                                    .to.textController[i]
                                : AdminTambahInformasiController
                                    .to.textController[i],
                            onTapClose: () async {
                              try {
                                AdminTambahKategoriInformasiController
                                    .to.isLoading.value = true;
                                await AdminTambahKategoriInformasiController.to
                                    .deleteKategoriInformasi(
                                        AdminTambahInformasiController
                                            .to.listKategoriId[i]);

                                setState(() {
                                  AdminTambahInformasiController
                                      .to.listKategoriNameInformasi
                                      .remove(AdminTambahInformasiController
                                          .to.listKategoriNameInformasi[i]);
                                });

                                await AdminTambahInformasiController.to
                                    .getDataKategoriInformasi();
                                AdminTambahKategoriInformasiController
                                    .to.isLoading.value = false;
                              } catch (e) {
                                AdminTambahKategoriInformasiController
                                    .to.isLoading.value = false;
                              }
                            },
                          ),
                        ),

                      // Add List
                      for (var i = 0; i < addListKategori.length; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: TextFieldTambahKategori(
                            key: ValueKey(addListKategori[i]),
                            suffixIcon: Icons.close_rounded,
                            controller: textEditingControllerList[i],
                            onTapClose: () {
                              setState(() {
                                addListKategori.remove(addListKategori[i]);
                                textEditingControllerList
                                    .remove(textEditingControllerList[i]);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
          ),

          // button simpan
          ButtonGradientAuth(
            text: "Simpan",
            onPressed: () async {
              try {
                var compareList = AdminTambahInformasiController
                    .to.listKategoriNameInformasi
                    .map((element) => element)
                    .toList();

                AdminTambahKategoriInformasiController.to.isLoading.value =
                    true;

                for (var i = 0;
                    i <
                        AdminTambahInformasiController
                            .to.listKategoriInformasi.length;
                    i++) {
                  if (AdminTambahInformasiController
                          .to.textController[i].text !=
                      compareList[i]) {
                    await AdminTambahKategoriInformasiController.to
                        .editKategoriInformasi(
                      AdminTambahInformasiController.to.listKategoriId[i],
                      AdminTambahInformasiController.to.textController[i].text,
                    );
                  }
                }

                for (var i = 0; i < textEditingControllerList.length; i++) {
                  AdminTambahKategoriInformasiController
                      .to.listNameKategoriInformasi
                      .add({
                    'name': textEditingControllerList[i].value.text,
                  });
                }

                for (var i = 0;
                    i <
                        AdminTambahKategoriInformasiController
                            .to.listNameKategoriInformasi.length;
                    i++) {
                  await AdminTambahKategoriInformasiController.to
                      .postKategoriInformasi(i);
                }

                textEditingControllerList.clear();
                addListKategori.clear();
                AdminTambahKategoriInformasiController
                    .to.listNameKategoriInformasi
                    .clear();

                await AdminTambahInformasiController.to
                    .getDataKategoriInformasi();

                AdminTambahKategoriInformasiController.to.isLoading.value =
                    false;
              } catch (e) {
                AdminTambahKategoriInformasiController.to.isLoading.value =
                    false;
                throw Exception(e);
              }
            },
          ),
        ],
      ),
    );
  }
}

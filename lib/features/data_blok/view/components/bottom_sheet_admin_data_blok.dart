// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import 'package:venturo_core/features/admin_informasi/view/components/text_field_tambah_kategori.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/data_blok/controllers/admin_tambah_blok.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DummyBlok {
  DummyBlok({
    required this.name,
  });

  String name;
}

class BottomSheetAdminDataBlok extends StatefulWidget {
  const BottomSheetAdminDataBlok({
    Key? key,
    this.getData,
    this.arguments,
  }) : super(key: key);

  final Function? getData;

  final Map<String, dynamic>? arguments;

  @override
  State<BottomSheetAdminDataBlok> createState() =>
      _BottomSheetAdminDataBlokState();
}

class _BottomSheetAdminDataBlokState extends State<BottomSheetAdminDataBlok> {
  List<DummyBlok> dummyBlok = [DummyBlok(name: "A")];

  var listBlok = DataBlokController.to.listBlok.map((value) => value).toList();

  // var listBlok = DataBlokController.to.listBlok
  //     .map((value) => value['name'])
  //     .toSet()
  //     .toList();

  var addListBlok = [];

  // List untuk menyimpan controller dari setiap TextField
  List<TextEditingController> textEditingControllerList = [];

  @override
  Widget build(BuildContext context) {
    print(listBlok);
    return Container(
      height: null,
      padding: EdgeInsets.only(
        top: 12.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h,
      ),
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
                    addListBlok.add('');
                    textEditingControllerList.add(TextEditingController());
                  });
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
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
                'Tambah Blok',
                textAlign: TextAlign.center,
                style: PoppinsTextStyle.fw600.copyWith(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),

          15.verticalSpace,

          // List Field Kategori
          Column(
            children: [
              // TextField data API
              for (var i = 0; i < listBlok.length; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: TextFieldTambahKategori(
                    key: ValueKey(listBlok[i]['id']),
                    suffixIcon: Icons.close_rounded,
                    controller: (listBlok[i]['name']!.isNotEmpty)
                        ? DataBlokController.to.textController[i]
                        : DataBlokController.to.textController[i],
                    onTapClose: () async {
                      try {
                        AdminTambahBlok.to.isLoading.value = true;
                        await AdminTambahBlok.to.deleteBlok(
                            DataBlokController.to.listBlok[i]['id']);

                        setState(() {
                          DataBlokController.to.listBlok.remove(
                              DataBlokController.to.listBlok[i]['name']);
                        });

                        await DataBlokController.to.getDataBlok();
                        AdminTambahBlok.to.isLoading.value = false;
                      } catch (e) {
                        AdminTambahBlok.to.isLoading.value = false;
                      }
                      // setState(() {
                      //   DataBlokController.to
                      //       .deleteBlok(DataBlokController.to.listBlok
                      //           .where((e) {
                      //             print(
                      //                 "Contains Value =   ${e.containsValue(listBlok[i]['name'])}");
                      //             return e.containsValue(listBlok[i]['name']);
                      //           })
                      //           .map((e) {
                      //             print("Id =   ${e["id"]}");
                      //             return e["id"];
                      //           })
                      //           .elementAt(0)
                      //           .toString());
                      //   listBlok.removeAt(i);
                      // });
                    },
                  ),
                ),

              // Add List
              for (var i = 0; i < addListBlok.length; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: TextFieldTambahKategori(
                    key: ValueKey(addListBlok[i]),
                    suffixIcon: Icons.close_rounded,
                    controller: textEditingControllerList[i],
                    onTapClose: () {
                      setState(() {
                        addListBlok.removeAt(i);
                        textEditingControllerList
                            .remove(textEditingControllerList[i]);
                      });
                    },
                  ),
                ),
            ],
          ),

          // button simpan
          ButtonGradientAuth(
            text: "Simpan",
            onPressed: () async {
              try {
                var compareList = DataBlokController.to.listBlok
                    .map((element) => element['name'])
                    .toList();

                AdminTambahBlok.to.isLoading.value = true;

                for (var i = 0;
                    i < DataBlokController.to.listBlok.length;
                    i++) {
                  if (DataBlokController.to.textController[i].text !=
                      compareList[i]) {
                    await AdminTambahBlok.to.editBlok(
                      DataBlokController.to.listBlok[i]['id'],
                      DataBlokController.to.textController[i].text,
                    );
                  }
                }

                for (var i = 0; i < textEditingControllerList.length; i++) {
                  AdminTambahBlok.to.listBlokName.add({
                    'name': textEditingControllerList[i].value.text,
                  });
                }

                for (var i = 0;
                    i < AdminTambahBlok.to.listBlokName.length;
                    i++) {
                  await AdminTambahBlok.to.postBlok(i);
                }

                textEditingControllerList.clear();
                addListBlok.clear();
                AdminTambahBlok.to.listBlokName.clear();

                await DataBlokController.to.getDataBlok();

                AdminTambahBlok.to.isLoading.value = false;
              } catch (e) {
                AdminTambahBlok.to.isLoading.value = false;
                throw Exception(e);
              }

              // for (var i = 0; i < textEditingControllerList.length; i++) {
              //   DataBlokController.to.listNamaBlok.add({
              //     'name': textEditingControllerList[i].value.text,
              //   });
              // }

              // DataBlokController.to.postBlok();
            },
          ),
        ],
      ),
    );
  }
}

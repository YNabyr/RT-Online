import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_iuran/constants/admin_iuran_assets_constant.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_iuran/view/components/card_admin_kategori_iuran.dart';
import 'package:venturo_core/features/admin_iuran/view/components/textfield_admin_iuran.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminTambahIuranScreen extends StatefulWidget {
  const AdminTambahIuranScreen({Key? key}) : super(key: key);

  @override
  State<AdminTambahIuranScreen> createState() => _AdminTambahIuranScreenState();
}

class _AdminTambahIuranScreenState extends State<AdminTambahIuranScreen> {
  final assetsConstant = AdminIuranAssetsConstant();

  @override
  Widget build(BuildContext context) {
    var nominal = 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const CustomHeaderAdmin(title: "Tambah Kaegori Iuran"),

          25.verticalSpace,

          Obx(
            () => SizedBox(
              height: 580.h,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: AdminIuranController.to.listField.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    key: ValueKey(AdminIuranController.to.listField[index]),
                    children: [
                      // TextField
                      TextFieldAdminIuran(
                        hint: "Masukkan Jenis Iuran",
                        controller: AdminIuranController
                            .to.listControllerJenisIuran[index],
                        onTapIcClose: () {
                          print(index);
                          setState(() {
                            AdminIuranController.to.listField.remove(
                                AdminIuranController.to.listField[index]);
                            AdminIuranController.to.listControllerJenisIuran
                                .remove(AdminIuranController
                                    .to.listControllerJenisIuran[index]);
                            AdminIuranController.to.listControllerNominal
                                .remove(AdminIuranController
                                    .to.listControllerNominal[index]);
                            AdminIuranController.to.listNominal.remove(
                                AdminIuranController.to.listNominal[index]);
                          });
                        },
                        label: "Jenis Iuran",
                        close: true,
                        icPreffix: false,
                        readOnly: false,
                      ),

                      15.verticalSpace,

                      // TextField
                      Obx(
                        () => TextFieldAdminIuran(
                          onEditingComplete: () {
                            AdminIuranController.to.listNominal[index] =
                                (AdminIuranController
                                            .to
                                            .listControllerNominal[index]
                                            .text ==
                                        ''
                                    ? 0
                                    : int.parse(AdminIuranController
                                        .to.listControllerNominal[index].text));

                            AdminIuranController.to.totalNominal.value =
                                AdminIuranController.to.listNominal.reduce(
                                    (value, element) => value + element);

                            print('LIST NOMINAL');
                            print(AdminIuranController.to.listNominal);
                          },
                          onChanged: (value) {
                            AdminIuranController
                                .to.listControllerNominal[index].text = value;

                            print(value);
                            print(AdminIuranController.to.totalNominal.value);
                          },
                          keyboardType: TextInputType.number,
                          controller: AdminIuranController
                              .to.listControllerNominal[index],
                          label: "Nominal",
                          hint: "Masukkan Nominal",
                          icPreffix: false,
                          readOnly: false,
                          nominal: true,
                        ),
                      ),

                      15.verticalSpace,
                    ],
                  );
                },
              ),
            ),
          ),

          // Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    print('tambah');
                    AdminIuranController.to.listField.add(1);
                    AdminIuranController.to.listControllerJenisIuran
                        .add(TextEditingController());
                    AdminIuranController.to.listControllerNominal
                        .add(TextEditingController());

                    // List Nominal
                    AdminIuranController.to.listNominal.value = [];
                    for (var i = 0;
                        i < AdminIuranController.to.listField.length;
                        i++) {
                      AdminIuranController.to.listNominal.add(
                          (AdminIuranController
                                      .to.listControllerNominal[i].text ==
                                  ''
                              ? 0
                              : int.parse(AdminIuranController
                                  .to.listControllerNominal[i].text)));
                    }
                  });
                },
                child: Container(
                  width: 116.w,
                  height: 36.w,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Center(
                    child: Text(
                      'Tambah',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: Colors.white,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
              24.horizontalSpace
            ],
          ),

          Expanded(child: Container()),

          // Row total Iuran
          Row(
            children: [
              Expanded(child: Container()),

              // Text
              Text(
                'Total Iuran :',
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 14.sp,
                ),
              ),

              10.horizontalSpace,

              // Text Nominal
              Obx(
                () => Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format(
                          (AdminIuranController.to.totalNominal.value != null)
                              ? AdminIuranController.to.totalNominal.value
                              : 0),
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              ),

              24.horizontalSpace,
            ],
          ),

          15.verticalSpace,

          ButtonGradientAuth(
            text: "Simpan",
            onPressed: () async {
              try {
                await AdminIuranController.to
                    .postIuran(AdminIuranController.to.listField.length);

                AdminIuranController.to.listField.clear();
                AdminIuranController.to.listControllerJenisIuran.clear();
                AdminIuranController.to.listControllerNominal.clear();
              } catch (e) {
                throw Exception(e);
              }
            },
          ),

          25.verticalSpace,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_iuran/constants/admin_iuran_assets_constant.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_iuran/view/components/textfield_admin_iuran.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminEditIuranScreen extends StatefulWidget {
  const AdminEditIuranScreen({Key? key}) : super(key: key);

  @override
  State<AdminEditIuranScreen> createState() => _AdminEditIuranScreenState();
}

class _AdminEditIuranScreenState extends State<AdminEditIuranScreen> {
  final assetsConstant = AdminIuranAssetsConstant();

  var controller = AdminIuranController.to;
  var args = Get.arguments;
  get fieldLength => args['field_lenght'];
  get idIuran => args['id'];
  get listidIuran => args['list_id'];

  @override
  Widget build(BuildContext context) {
    var nominal = 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const CustomHeaderAdmin(title: "Edit Kaegori Iuran"),

          25.verticalSpace,

          Obx(
            () => SizedBox(
              height: 580.h,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.listFieldEdit.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    key: ValueKey(controller.listFieldEdit[index]),
                    children: [
                      // TextField
                      TextFieldAdminIuran(
                        hint: "Masukkan Jenis Iuran",
                        controller:
                            AdminIuranController.to.listInputEditIuran[index],
                        onTapIcClose: () {
                          print(index);
                          setState(() {
                            controller.listFieldEdit
                                .remove(controller.listFieldEdit[index]);
                            controller.listInputEditIuran.remove(
                                AdminIuranController
                                    .to.listInputEditIuran[index]);
                            controller.listInputEditNominal.remove(
                                AdminIuranController
                                    .to.listInputEditNominal[index]);
                            controller.listEditNominal
                                .remove(controller.listEditNominal[index]);
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
                            controller.listEditNominal[index] =
                                (AdminIuranController.to
                                            .listInputEditNominal[index].text ==
                                        ''
                                    ? 0
                                    : int.parse(AdminIuranController
                                        .to.listInputEditNominal[index].text));

                            controller.totalEditNominal.value = controller
                                .listEditNominal
                                .reduce((value, element) => value + element);

                            print('LIST NOMINAL');
                            print(controller.listEditNominal);
                          },
                          onChanged: (value) {
                            AdminIuranController
                                .to.listInputEditNominal[index].text = value;

                            print(value);
                            print(controller.totalEditNominal.value);
                          },
                          keyboardType: TextInputType.number,
                          controller: AdminIuranController
                              .to.listInputEditNominal[index],
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
                    controller.listFieldEdit.add(1);
                    controller.listInputEditIuran.add(TextEditingController());
                    controller.listInputEditNominal
                        .add(TextEditingController());

                    // List Nominal
                    controller.listEditNominal.value = [];
                    for (var i = 0; i < controller.listFieldEdit.length; i++) {
                      controller.listEditNominal.add((AdminIuranController
                                  .to.listInputEditNominal[i].text ==
                              ''
                          ? 0
                          : int.parse(AdminIuranController
                              .to.listInputEditNominal[i].text)));
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
                      .format((controller.totalEditNominal.value != null)
                          ? controller.totalEditNominal.value
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
                await controller.editIuran(
                  controller.listFieldEdit.length,
                  id: idIuran,
                  idIuran: listidIuran,
                );

                controller.listFieldEdit.clear();
                controller.listInputEditIuran.clear();
                controller.listInputEditNominal.clear();
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

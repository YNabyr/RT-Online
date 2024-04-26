import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_iuran/constants/admin_iuran_assets_constant.dart';
import 'package:venturo_core/features/admin_iuran/controllers/admin_iuran_controller.dart';
import 'package:venturo_core/features/admin_iuran/view/components/card_admin_kategori_iuran.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_tambah_iuran_screen.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminKategoriIuranScreen extends StatelessWidget {
  AdminKategoriIuranScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminIuranAssetsConstant();
  var controller = AdminIuranController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const CustomHeaderAdmin(title: "Kategori Iuran"),

          25.verticalSpace,

          SizedBox(
            height: 670.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.listIuran.length,
              itemBuilder: (BuildContext ctx, int index) {
                // Init Variable
                var listIuran = controller.listIuran[index];

                return Center(
                  child: CardAdminKategoriIuran(
                    itemCount: listIuran['detail'].length,
                    title: [
                      for (var i = 0; i < listIuran['detail'].length; i++)
                        listIuran['detail'][i]['name'],
                    ],
                    nominal: [
                      for (var i = 0; i < listIuran['detail'].length; i++)
                        (listIuran['detail'][i]['nominal']),
                    ],
                    totalNominal: listIuran['nominal_dues'],
                    warga: 20,
                    onTap: () async {
                      // Variable
                      controller.listFieldEdit.value = [];
                      controller.listInputEditIuran.value = [];
                      controller.listInputEditNominal.value = [];
                      controller.listEditNominal.value = [];
                      controller.listIdIuran.value = [];

                      // Logic
                      for (var i = 0; i < listIuran['detail'].length; i++) {
                        controller.listFieldEdit.add(1);
                        controller.listInputEditIuran.add(TextEditingController(
                            text: listIuran['detail'][i]['name']));
                        controller.listInputEditNominal.add(
                            TextEditingController(
                                text: listIuran['detail'][i]['nominal']
                                    .toString()));
                        controller.listEditNominal
                            .add(listIuran['detail'][i]['nominal']);
                        controller.listIdIuran
                            .add(listIuran['detail'][i]["id"]);
                      }

                      print("INI ID IURAN :");
                      print(listIuran['id']);
                      print(controller.listIdIuran);

                      Get.toNamed(Routes.adminEditIuranRoute, arguments: {
                        "field_length": listIuran['detail'].length,
                        "id": listIuran['id'],
                        "list_id": controller.listIdIuran,
                      });
                    },
                  ),
                );
              },
            ),
          ),

          Expanded(child: Container()),

          ButtonGradientAuth(
              text: "Tambah Kategori Iuran",
              onPressed: () {
                Get.toNamed(Routes.adminTambahIuranRoute);
              }),

          25.verticalSpace,
        ],
      ),
    );
  }
}

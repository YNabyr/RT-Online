import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venturo_core/features/admin_general/view/components/textfield_admin_general.dart';
import 'package:venturo_core/features/admin_informasi/view/components/bottomsheet_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/dropdown_admin_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/components/header_admin_informasi.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_assets_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/empty_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/textfield_admin_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/data_blok/controllers/admin_tambah_blok.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/models/blok.dart';
import 'package:venturo_core/features/data_blok/view/components/bottom_sheet_admin_data_blok.dart';
import 'package:venturo_core/features/data_blok/view/components/dropdown_admin_data_blok.dart';
import 'package:venturo_core/shared/widgets/custom_dropdown_button2.dart';

class AdminTambahDataRumahScreen extends StatefulWidget {
  const AdminTambahDataRumahScreen({Key? key}) : super(key: key);

  @override
  State<AdminTambahDataRumahScreen> createState() =>
      _AdminTambahDataRumahScreenState();
}

class _AdminTambahDataRumahScreenState
    extends State<AdminTambahDataRumahScreen> {
  final assetsConstant = AdminPengumumanAssetsConstant();

  String? selectedItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const HeaderAdminInformasi(title: "Tambah Data Rumah"),

          25.verticalSpace,

          // dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => CustomDropdownButton2(
                  label: "Blok",
                  hint: "Pilih Blok",
                  value: DataBlokController.to.selectedItems.value,
                  buttonWidth: 332.w,
                  dropdownWidth: 332.w,
                  dropdownItems: DataBlokController.to.listBlok
                      .map<String>(
                        (blok) {
                          return blok['name']!;
                        },
                      )
                      .toSet()
                      .toList(),
                  onChanged: (items) {
                    DataBlokController.to.selectedItems.value = items;

                    AdminTambahBlok.to.selectId;
                    print(AdminTambahBlok.to.selectedId);
                  },
                ),
              ),

              10.horizontalSpace,

              // Button tambah
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    scrollControlDisabledMaxHeightRatio: double.infinity,
                    builder: (BuildContext context) {
                      return const BottomSheetAdminDataBlok();
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

          // NO Rumah
          TextFieldAdminGeneral(
            label: "Nomor Rumah",
            hint: "Masukkan No. Rumah",
            keyboardType: TextInputType.number,
            controller: AdminTambahBlok.to.rumahController,
            isEdit: true,
          ),

          15.verticalSpace,

          // // DropDown
          // Obx(
          //   () => CustomDropdownButton2(
          //     label: "Nomor Rumah",
          //     hint: "Masukkan No. Rumah",
          //     value: DataBlokController.to.yourObject.value,
          //     buttonWidth: 382.w,
          //     dropdownWidth: 382.w,
          //     dropdownItems: DataBlokController.to.houseInfoList
          //         .map((houses) {
          //           return houses['house_number'].toString();
          //         })
          //         .toSet()
          //         .toList(),
          //     onChanged: (items) {
          //       DataBlokController.to.yourObject.value = items;
          //     },
          //   ),
          // ),

          Expanded(child: Container()),

          // Button Simpan
          ButtonGradientAuth(
            text: "Simpan",
            onPressed: () async {
              await AdminTambahBlok.to.postHouse();
            },
          ),

          24.verticalSpace,
        ],
      ),
    );
  }
}

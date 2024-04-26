import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/admin_uang_keluar/constants/admin_uang_keluar_assets_constant.dart';
import 'package:venturo_core/features/admin_uang_keluar/controllers/admin_uang_keluar_controller.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/dropdown_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/textfield_admin_uang_masuk.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminTambahUangKeluarScreen extends StatefulWidget {
  const AdminTambahUangKeluarScreen({Key? key}) : super(key: key);

  @override
  State<AdminTambahUangKeluarScreen> createState() =>
      _AdminTambahUangKeluarScreenState();
}

class _AdminTambahUangKeluarScreenState
    extends State<AdminTambahUangKeluarScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const CustomHeaderAdmin(title: "Tambah Uang Keluar"),

          25.verticalSpace,

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Keterangan Pengeluaran",
            border: false,
            icPreffix: false,
            readOnly: false,
            hint: "Masukkan keterangan",
          ),
          15.verticalSpace,

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Harga Total",
            border: false,
            icPreffix: false,
            nominal: true,
            readOnly: false,
            hint: "Masukkan Nominal",
          ),

          15.verticalSpace,

          // textfield tanggal
          TextFieldAdminUangMasuk(
            label: "Tanggal",
            border: false,
            icPreffix: true,
            readOnly: false,
            controller: AdminUangKeluarController.to.controller,
            hint: "Pilih Tanggal",
            onTapPreffixIcon: () async {
              AdminUangKeluarController.to.selectDate(context);
            },
          ),

          10.verticalSpace,
          SizedBox(
            width: 382.w,
            child: const Divider(),
          ),

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Keterangan",
            border: false,
            icPreffix: false,
            readOnly: false,
            hint: "Semen",
            close: true,
          ),
          15.verticalSpace,

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Qty (Banyak)",
            border: false,
            icPreffix: false,
            readOnly: false,
            hint: "10 karung",
          ),

          15.verticalSpace,

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Nominal",
            border: false,
            icPreffix: false,
            nominal: true,
            readOnly: false,
            hint: "100.000",
            hintColor: Colors.black,
          ),

          15.verticalSpace,

          // Upload
          const UploadGambarCustom(label: "Bukti"),

          11.verticalSpace,

          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 116.w,
                height: 36.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Color(0xFF8B7EF6)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tambah',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: const Color(0xFF8B7EF6),
                        fontSize: 10.sp,
                      ),
                    ),
                    8.horizontalSpace,
                    Icon(Icons.add, color: const Color(0xFF8B7EF6), size: 15.w),
                  ],
                ),
              ),
            ),
          ),

          Expanded(child: Container()),

          ButtonGradientAuth(text: "Simpan", onPressed: () {}),

          24.verticalSpace,
        ],
      ),
    );
  }
}

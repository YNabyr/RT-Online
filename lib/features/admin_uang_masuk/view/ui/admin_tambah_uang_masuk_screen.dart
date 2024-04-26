import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_pengumuman/view/components/upload_gambar_custom.dart';
import 'package:venturo_core/features/admin_uang_masuk/constants/admin_uang_masuk_assets_constant.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/carrd_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/dropdown_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/textfield_admin_uang_masuk.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/topbar_admin_uang_masuk.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/data_blok/view/components/search_bar_admin_data_blok.dart';
import 'package:venturo_core/features/iuran_warga/view/components/header_rekap_bulanan.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminTambahUangMasukScreen extends StatelessWidget {
  AdminTambahUangMasukScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminUangMasukAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // header
          const CustomHeaderAdmin(title: "Tambah Uang Masuk"),

          25.verticalSpace,

          // dropdown
          const DropdownAdminUangMasuk(
            label: "Nama",
            hintText: "Pilih Nama",
          ),

          15.verticalSpace,

          // dropdown
          const DropdownAdminUangMasuk(
            label: "Jenis Pemasukan",
            hintText: "Iuran",
          ),

          15.verticalSpace,

          // dropdown
          const DropdownAdminUangMasuk(
            label: "Bulan",
            hintText: "Pilih Bulan",
          ),

          15.verticalSpace,

          // textfield
          const TextFieldAdminUangMasuk(
            label: "Nominal",
            border: false,
            icPreffix: false,
            nominal: true,
            readOnly: false,
            hint: "Masukkan Nominal",
          ),

          15.verticalSpace,

          // textfield tanggal
          const TextFieldAdminUangMasuk(
            label: "Tanggal",
            border: false,
            icPreffix: true,
            readOnly: false,
            hint: "Pilih Tanggal",
          ),

          15.verticalSpace,

          // dropdown
          const DropdownAdminUangMasuk(
            label: "Diterima Oleh",
            hintText: "Pilih Penerima",
          ),

          15.verticalSpace,

          // Upload
          const UploadGambarCustom(),

          Expanded(child: Container()),

          ButtonGradientAuth(text: "Simpan", onPressed: () {}),

          24.verticalSpace,
        ],
      ),
    );
  }
}

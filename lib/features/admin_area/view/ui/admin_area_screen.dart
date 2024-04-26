import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_area/constants/admin_area_assets_constant.dart';
import 'package:venturo_core/features/admin_area/view/components/button_admin_area.dart';
import 'package:venturo_core/features/admin_area/view/components/header_admin_area.dart';
import 'package:venturo_core/features/admin_general/view/ui/admin_general_screen.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_hak_akses_screen.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_informasi_screen.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_iuran_screen.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/view/ui/admin_konfirmasi_pembayaran_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_pengumuman_screen.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_uang_keluar_screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_uang_masuk_screen.dart';
import 'package:venturo_core/features/admin_undang_warga/view/ui/admin_undang_warga_screen.dart';
import 'package:venturo_core/features/data_blok/view/ui/data_blok_screen.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class AdminAreaScreen extends StatelessWidget {
  AdminAreaScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminAreaAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            const HeaderAdminArea(title: "Admin Area"),

            25.verticalSpace,

            SizedBox(
              width: 382.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pengaturan
                  Text(
                    'Pengaturan',
                    style: PoppinsTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 20.sp,
                    ),
                  ),

                  15.verticalSpace,

                  ButtonAdminArea(
                    text: "General",
                    onTap: () {
                      Get.toNamed(Routes.adminGeneralRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Pengumuman",
                    onTap: () {
                      Get.toNamed(Routes.adminPengumumanRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Informasi",
                    onTap: () {
                      Get.toNamed(Routes.adminInformasiRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Iuran Warga",
                    onTap: () {
                      Get.toNamed(Routes.adminIuranRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Hak Akses",
                    onTap: () {
                      Get.toNamed(Routes.adminHakAksesRoute);
                    },
                  ),

                  15.verticalSpace,

                  // Penghuni
                  Text(
                    'Penghuni',
                    style: PoppinsTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 20.sp,
                    ),
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Undang Warga",
                    onTap: () {
                      Get.toNamed(Routes.adminUndangWarga);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Blok dan No Rumah",
                    onTap: () {
                      Get.toNamed(Routes.adminDataBlok);
                    },
                  ),

                  15.verticalSpace,

                  // Transaksi
                  Text(
                    'Transaksi',
                    style: PoppinsTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 20.sp,
                    ),
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Konfirmasi Pembayaran",
                    onTap: () {
                      Get.toNamed(Routes.adminKonfirmasiPembayaranRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Uang Masuk",
                    onTap: () {
                      Get.toNamed(Routes.adminUangMasukRoute);
                    },
                  ),

                  15.verticalSpace,
                  ButtonAdminArea(
                    text: "Uang Keluar",
                    onTap: () {
                      Get.toNamed(Routes.adminUangKeluarRoute);
                    },
                  ),

                  25.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

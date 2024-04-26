import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/textfield_admin_uang_masuk.dart';
import 'package:venturo_core/features/data_warga/view/components/data_warga_bottomsheet.dart';
import 'package:venturo_core/features/iuran_warga/view/components/bottom_sheet_rekap_bulanan.dart';
import 'package:venturo_core/features/laporan_keuangan/constants/laporan_keuangan_assets_constant.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_pengeluaran_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/expansion_tile_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/header_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/textfield_detail_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/tobar_laporan_keuangan.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_pembayaran_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminDetailPemasukanScreen extends StatelessWidget {
  const AdminDetailPemasukanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nominal = 300000;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const CustomHeaderAdmin(title: "Detail Pemasukan"),

            23.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Nama",
              icPreffix: false,
              border: true,
              hint: "Ahmad Sujadi",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Jenis Pemasukan",
              icPreffix: false,
              border: true,
              hint: "Iuran",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Bulan",
              icPreffix: false,
              border: true,
              hint: "Agustus",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Nominal",
              icPreffix: false,
              border: true,
              hint: "Rp 1.000.000",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Tanggal",
              icPreffix: false,
              border: true,
              hint: "Senin, 30 Okt 2023, 09:00",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            // TextField
            const TextFieldAdminUangMasuk(
              label: "Diterima Oleh",
              icPreffix: false,
              border: true,
              hint: "Abdullah",
              hintColor: Colors.black,
            ),

            15.verticalSpace,

            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bukti',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),

            10.verticalSpace,

            // Bukti
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 358.w,
                    height: 109.h,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://www.uspace.id/wp-content/uploads/2022/03/bukti-transfer-m-banking-bca-asli..jpg",
                        ),
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),

                // Button
                Positioned(
                  top: (109.h - 24.h) / 2, // Mengatur posisi vertical tengah
                  left: (358.w - 24.w) / 2, // Mengatur posisi horizontal tengah
                  child: eyeButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget eyeButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Button
          Positioned(
            child: Container(
              width: 35.w,
              height: 35.w,
              decoration: ShapeDecoration(
                color: const Color(0xFF094181),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // Svg
          Positioned(
            top: (35.w - 26.w) / 2,
            left: (35.w - 26.w) / 2,
            child: SvgPicture.asset("assets/images/ic_eye_on_fill.svg",
                height: 26.w),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/features/laporan_keuangan/constants/laporan_keuangan_assets_constant.dart';
import 'package:venturo_core/features/laporan_keuangan/controllers/laporan_keuangan_controller.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/bottom_sheet_filter_tanggal.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/card_pengeluaran_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/date_range_bottomsheet.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/expansion_tile_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/header_laporan_keuangan.dart';
import 'package:venturo_core/features/laporan_keuangan/view/components/tobar_laporan_keuangan.dart';
import 'package:venturo_core/features/pembayaran/view/components/card_pembayaran_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';

class LaporanKeuanganScreen extends StatelessWidget {
  LaporanKeuanganScreen({Key? key}) : super(key: key);

  final assetsConstant = LaporanKeuanganAssetsConstant();

  final LaporanKeuanganController controller =
      Get.put(LaporanKeuanganController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Obx(
          () => Column(
            children: [
              // header
              const HeaderLaporanKeuangan(
                title: "Laporan Keuangan",
              ),

              25.verticalSpace,

              // Row Topbar, icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tobar
                  TopbarLaporanKeuangan(
                    onTap: () {
                      showModalBottomSheet(
                        scrollControlDisabledMaxHeightRatio: double.infinity,
                        context: context,
                        builder: (ctx) {
                          return const BottomSheetFilterTanggal();
                        },
                      );
                    },
                  ),

                  12.horizontalSpace,

                  // Icon
                  GestureDetector(
                    onTap: () {
                      controller.isFilter.value = !controller.isFilter.value;
                    },
                    child: Container(
                      width: 44.w,
                      height: 44.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 8,
                            offset: Offset(4, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: SvgPicture.asset("assets/outline/grid.svg"),
                    ),
                  ),
                ],
              ),

              25.verticalSpace,

              // saldo akhir
              Container(
                width: 382.w,
                padding: EdgeInsets.symmetric(vertical: 12.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    // Text Saldo Akhir
                    Text(
                      'Saldo Akhir',
                      style: PoppinsTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 20.sp,
                      ),
                    ),

                    // Nominal
                    Text(
                      'Rp. 16.000.000',
                      style: PoppinsTextStyle.fw600.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),

              25.verticalSpace,

              // Tabbar
              TabBar(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                dividerColor: Colors.grey,
                dividerHeight: 2.w,
                indicatorWeight: 2.w,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: const Color(0xFF6454F0),
                labelColor: const Color(0xFF6454F0),
                unselectedLabelColor: const Color(0xff9597A3),
                tabs: [
                  Tab(child: buildTab(text: "Pemasukan", nominal: 2500000)),
                  Tab(
                    child: buildTab(text: "Pengeluaran", nominal: 1500000),
                  ),
                ],
              ),

              // Tabbar View Card
              Expanded(
                child: TabBarView(
                  children: [
                    // Pemasukan
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          23.verticalSpace,

                          (controller.isFilter.value == false)
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    children: [
                                      const CardLaporanKeuangan(
                                          amount: 1000000),
                                      15.verticalSpace,
                                      const CardLaporanKeuangan(
                                          amount: 1000000),
                                      15.verticalSpace,
                                      const CardLaporanKeuangan(
                                          amount: 1000000),
                                    ],
                                  ),
                                )
                              :
                              // Iuran
                              ExpansionTileLaporanKeuangan(
                                  title: "Iuran",
                                  amount: 3000000,
                                  children: [
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                  ],
                                ),

                          25.verticalSpace,

                          // Sumbangan
                          (controller.isFilter.value == false)
                              ? Container()
                              : ExpansionTileLaporanKeuangan(
                                  title: "Sumbangan",
                                  amount: 3000000,
                                  children: [
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                    15.verticalSpace,
                                    const CardLaporanKeuangan(amount: 1000000),
                                  ],
                                ),
                        ],
                      ),
                    ),

                    // Pengeluaran
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          23.verticalSpace,

                          // Pembangunan
                          (controller.isFilter.value == false)
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    children: [
                                      const CardPengeluaranKeuangan(
                                          amount: 1000000),
                                      15.verticalSpace,
                                      const CardPengeluaranKeuangan(
                                          amount: 1000000),
                                      15.verticalSpace,
                                      const CardPengeluaranKeuangan(
                                          amount: 1000000),
                                    ],
                                  ),
                                )
                              : ExpansionTileLaporanKeuangan(
                                  title: "Pembangunan",
                                  amount: 3000000,
                                  children: [
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                  ],
                                ),

                          25.verticalSpace,

                          // Sumbangan
                          (controller.isFilter.value == false)
                              ? Container()
                              : ExpansionTileLaporanKeuangan(
                                  title: "Perbaikan",
                                  amount: 3000000,
                                  children: [
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                    const CardPengeluaranKeuangan(
                                        amount: 1000000),
                                    15.verticalSpace,
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildTab({required String text, int? nominal}) {
    return Column(
      children: [
        // Text
        Text(
          text,
          style: NunitoTextStyle.fw700.copyWith(
            fontSize: 16.sp,
          ),
        ),

        // Nominal
        Text(
          NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: "Rp ")
              .format((nominal != null) ? nominal : 0),
          style: NunitoTextStyle.fw500.copyWith(
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

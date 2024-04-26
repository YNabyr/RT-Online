import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class AdminDetailPengeluaranScreen extends StatelessWidget {
  const AdminDetailPengeluaranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get Arguments
    var args = Get.arguments;
    var keteranganPengeluaran = args['keterangan_pengeluaran'];
    var total = args['total'];
    var date = args['date'];
    List detailPengeluaran = args['detail_pengeluaran'];
    // var keterangan = detailPengeluaran;
    // var banyak = detailPengeluaran;
    // var nominal = detailPengeluaran;
    // var bukti = detailPengeluaran;

    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const HeaderLaporanKeuangan(title: "Pengeluaran"),

          23.verticalSpace,

          // Textfield
          TextfieldDetailKeuangan(
            label: "Keterangan Pengeluaran",
            keterangan: keteranganPengeluaran,
          ),

          15.verticalSpace,

          // Textfield
          TextfieldDetailKeuangan(
            label: "Tanggal",
            keterangan: date,
          ),

          15.verticalSpace,

          ListView.builder(
            shrinkWrap: true, // Tambahkan properti shrinkWrap di sini
            itemCount: detailPengeluaran.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  // container image,
                  buildContentImage(
                    nominal: detailPengeluaran[index]['nominal'],
                    url:
                        "https://i.pinimg.com/564x/d1/b9/07/d1b907a965a32a7a3003043d507255d1.jpg",
                    children: [
                      // buildFieldTitle,
                      buildFieldTitle(
                          text: detailPengeluaran[index]['keterangan']),

                      // Row
                      Row(
                        children: [
                          buildSmallText50W(text: "Jumlah"),
                          12.horizontalSpace,
                          buildSmallText(text: ":"),
                          12.horizontalSpace,
                          buildSmallText(
                              text: detailPengeluaran[index]['banyak']
                                  .toString()),
                        ],
                      ),

                      // Row
                      Row(
                        children: [
                          buildSmallText50W(text: "Total"),
                          12.horizontalSpace,
                          buildSmallText(text: ":"),
                          12.horizontalSpace,
                          buildSmallText(
                            widget: Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: "Rp ")
                                  .format((detailPengeluaran[index]
                                              ['nominal'] !=
                                          null)
                                      ? detailPengeluaran[index]['nominal']
                                      : 0),
                              style: NunitoTextStyle.fw400
                                  .copyWith(fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          15.verticalSpace,

          // total pengeluaran
          SizedBox(
            width: 382.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // total pengeluaran
                Text(
                  'Total Pengeluaran',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                // Nominal
                Text(
                  NumberFormat.currency(
                          locale: 'id', decimalDigits: 0, symbol: "Rp ")
                      .format((total != null) ? total : 0),
                  style: PoppinsTextStyle.fw600.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContentImage(
      {required int nominal, String? url, List<Widget>? children}) {
    return Container(
      width: 382.w,
      padding: EdgeInsets.all(12.w),
      // decoration: const BoxDecoration(
      //   border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
      // ),

      // Row image,
      child: Row(
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 171.5.w,
              height: 87.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage((url == null)
                      ? "https://i.pinimg.com/564x/d1/b9/07/d1b907a965a32a7a3003043d507255d1.jpg"
                      : url),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          15.horizontalSpace,

          // Column
          SizedBox(
            height: 81.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (children == null) ? [] : children,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallText50W({String? text, Widget? widget}) {
    return SizedBox(
      width: 50.w,
      child: (text != null)
          ? Text(
              text,
              style: NunitoTextStyle.fw400.copyWith(
                color: Colors.black,
                fontSize: 13.sp,
              ),
            )
          : widget,
    );
  }

  Widget buildSmallText({String? text, Widget? widget}) {
    return SizedBox(
      child: (text != null)
          ? Text(
              text,
              style: NunitoTextStyle.fw400.copyWith(
                color: Colors.black,
                fontSize: 13.sp,
              ),
            )
          : widget,
    );
  }

  Widget buildFieldTitle({required String text}) {
    return Text(
      text,
      style: NunitoTextStyle.fw700.copyWith(
        color: Colors.black,
        fontSize: 16.sp,
      ),
    );
  }
}

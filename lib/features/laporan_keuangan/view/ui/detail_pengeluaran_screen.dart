import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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

class DetailPengeluaranScreen extends StatelessWidget {
  DetailPengeluaranScreen({Key? key}) : super(key: key);

  final assetsConstant = LaporanKeuanganAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var nominal = 1000000;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const HeaderLaporanKeuangan(title: "Pengeluaran"),

          23.verticalSpace,

          // Perumahan
          Text(
            'Perumahan Griya Shanta B - 09',
            textAlign: TextAlign.center,
            style: PoppinsTextStyle.fw400.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),

          15.verticalSpace,

          // Textfield
          const TextfieldDetailKeuangan(
            label: "Jenis Pengeluaran",
            keterangan: "Pembangunan",
          ),

          15.verticalSpace,

          // Textfield
          const TextfieldDetailKeuangan(
            label: "Tanggal",
            keterangan: "2 Okt 2023 09:00",
          ),

          15.verticalSpace,

          // Textfield
          const TextfieldDetailKeuangan(
            label: "Keterangan",
            keterangan: "Mushola",
          ),

          15.verticalSpace,

          // container image,
          buildContentImage(
            nominal,
            url:
                "https://i.pinimg.com/564x/d1/b9/07/d1b907a965a32a7a3003043d507255d1.jpg",
            children: [
              //
              buildFieldTitle(text: "Beli Semen"),

              // Row
              Row(
                children: [
                  //
                  buildSmallText50W(text: "Jumlah"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: ":"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: "50 Karung"),
                ],
              ),

              // Row
              Row(
                children: [
                  //
                  buildSmallText50W(text: "Total"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: ":"),

                  12.horizontalSpace,

                  // Nominal
                  buildSmallText(
                    widget: Text(
                      NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: "Rp ")
                          .format((nominal != null) ? nominal : 0),
                      style: NunitoTextStyle.fw400.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //
          // container image,
          buildContentImage(
            nominal,
            url:
                "https://i.pinimg.com/564x/d1/b9/07/d1b907a965a32a7a3003043d507255d1.jpg",
            children: [
              //
              buildFieldTitle(text: "Beli Semen"),

              // Row
              Row(
                children: [
                  //
                  buildSmallText50W(text: "Jumlah"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: ":"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: "50 Karung"),
                ],
              ),

              // Row
              Row(
                children: [
                  //
                  buildSmallText50W(text: "Total"),

                  12.horizontalSpace,

                  //
                  buildSmallText(text: ":"),

                  12.horizontalSpace,

                  // Nominal
                  buildSmallText(
                    widget: Text(
                      NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: "Rp ")
                          .format((nominal != null) ? nominal : 0),
                      style: NunitoTextStyle.fw400.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
                      .format((nominal != null) ? nominal : 0),
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

  Container buildContentImage(int nominal,
      {String? url, List<Widget>? children}) {
    return Container(
      width: 382.w,
      padding: EdgeInsets.all(12.w),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),

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
            height: 81.w,
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

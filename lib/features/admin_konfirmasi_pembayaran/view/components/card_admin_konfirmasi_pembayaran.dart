// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';

class CardAdminKonfirmasiPembayaran extends StatefulWidget {
  const CardAdminKonfirmasiPembayaran({
    Key? key,
    required this.amount,
    this.onTap,
    this.isBayar = false,
  }) : super(key: key);

  final int amount;
  final void Function()? onTap;
  final bool? isBayar;

  @override
  State<CardAdminKonfirmasiPembayaran> createState() =>
      _CardAdminKonfirmasiPembayaranState();
}

class _CardAdminKonfirmasiPembayaranState
    extends State<CardAdminKonfirmasiPembayaran> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 382.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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

        // Row Image profile, nama, button, nominal
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image Profile
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Container
                    Container(
                      padding: EdgeInsets.all(8.w),
                      width: 66.w,
                      height: 66.h,

                      // Profile Image
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/57/a0/33/57a033a6286934d52087b6f54c697e09.jpg"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),

                    // Blok
                    Positioned(
                      bottom: 4.h,
                      child: Container(
                        width: 35.w,
                        height: 14.h,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF094181),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            "C-9",
                            style: NunitoTextStyle.fw600.copyWith(
                              color: const Color(0xFFE2DDFE),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Column Nama, tgl
                SizedBox(
                  width: 144.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmad Sujadi',
                        style: NunitoTextStyle.fw700.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 16.sp,
                        ),
                      ),

                      // tgl
                      Text(
                        '30 Okt 2023, 09:00',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                // Column Button, nominal
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Button
                    Container(
                      height: 24.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: ShapeDecoration(
                        color: (widget.isBayar == true)
                            ? const Color(0xFF27D18A)
                            : const Color(0xFFD40202),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        (widget.isBayar == false)
                            ? 'Belum Terbayar'
                            : "Terbayarkan",
                        textAlign: TextAlign.center,
                        style: NunitoTextStyle.fw600.copyWith(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),

                    4.verticalSpace,

                    // Nominal
                    Text(
                      NumberFormat.currency(
                              locale: "id", decimalDigits: 0, symbol: "Rp ")
                          .format((widget.amount != null) ? widget.amount : 0),
                      style: NunitoTextStyle.fw800.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),

                // ic arrow down
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: // Icon Image
                        (!isExpanded)
                            ? SvgPicture.asset(
                                "assets/outline/arrow-ios-down.svg")
                            : SvgPicture.asset(
                                "assets/outline/arrow-ios-up.svg")),
              ],
            ),
            if (isExpanded) // Content displayed when expanded
              Column(
                children: [
                  SizedBox(height: 15.h),
                  // Bulan
                  Row(
                    children: [
                      // ic arrow right
                      SvgPicture.asset(
                        "assets/outline/arrow-ios-right.svg",
                        height: 15.h,
                      ),

                      8.horizontalSpace,

                      // Text
                      Expanded(
                        child: Text(
                          'Month',
                          style: NunitoTextStyle.fw400.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),

                      8.horizontalSpace,

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: "id", decimalDigits: 0, symbol: "Rp ")
                            .format(
                                (widget.amount != null) ? widget.amount : 0),
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),

                  10.verticalSpace,
                  const Divider(),
                  10.verticalSpace,

                  // Total Pembayaran
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      Text(
                        'Total Pembayaran',
                        style: NunitoTextStyle.fw700.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 13.sp,
                        ),
                      ),

                      // Nominal
                      Text(
                        NumberFormat.currency(
                                locale: "id", decimalDigits: 0, symbol: "Rp ")
                            .format(
                                (widget.amount != null) ? widget.amount : 0),
                        style: NunitoTextStyle.fw700.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),

                  15.verticalSpace,

                  // button
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 113.w,
                      height: 36.h,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF6EE2F5), Color(0xFF6454F0)],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          12.horizontalSpace,
                          SvgPicture.asset(
                            "assets/images/checkmark_circle_2.svg",
                            height: 15.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          8.horizontalSpace,
                          Text(
                            'Konfirmasi',
                            style: NunitoTextStyle.fw700.copyWith(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

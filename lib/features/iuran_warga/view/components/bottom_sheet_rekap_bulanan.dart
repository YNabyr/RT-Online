// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetRekapBulanan extends StatelessWidget {
  const BottomSheetRekapBulanan({
    Key? key,
    this.isBayar = false,
  }) : super(key: key);

  final bool? isBayar;
  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      width: 430.w,
      padding: EdgeInsets.only(
        top: 12.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Column(
        children: [
          // Bar
          Container(
            width: 100.w,
            height: 5.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          // Text
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            height: 30.h,
            child: Text(
              textAlign: TextAlign.center,
              'November - 2023',
              style: PoppinsTextStyle.fw600.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),

          // Profile
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Container
              Container(
                padding: EdgeInsets.all(8.w),
                width: 148.w,
                height: 148.h,

                // Profile Image
                child: Container(
                  width: 132.w,
                  height: 132.h,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/39/0e/57/390e573833695377cf9afc85d5ae50aa.jpg"),
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
                  width: 55.w,
                  height: 26.h,
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF094181),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),

                  // Text
                  child: Center(
                    child: Text(
                      'A-20',
                      style: NunitoTextStyle.fw700.copyWith(
                        color: const Color(0xFFE2DDFE),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          8.verticalSpace,

          // Text Nama
          Text(
            'Ahmad Sujadi',
            style: PoppinsTextStyle.fw600.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 20.sp,
            ),
          ),

          15.verticalSpace,

          // Terbayarkan
          if (isBayar == true)
            Column(
              children: [
                // Status
                const TextFieldRekapBulanan(
                    label: "Status", keterangan: "Terbayar"),

                15.verticalSpace,

                // Total Iuran
                const TextFieldRekapBulanan(
                    label: "Total Iuran", keterangan: "Rp 300.000"),

                15.verticalSpace,

                // Tanggal Pembayaran
                const TextFieldRekapBulanan(
                    label: "Tanggal Pembayaran",
                    keterangan: "02 November 2023"),

                15.verticalSpace,

                // Dikonfirmasi oleh
                const TextFieldRekapBulanan(
                    label: "Dikonfirmasi Oleh", keterangan: "Ali Sodikin"),

                15.verticalSpace,

                // Bukti Pembayaran
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bukti Pembayaran",
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 14.sp,
                    ),
                  ),
                ),

                6.verticalSpace,

                // Stack Image, button Bukti Pembayaran
                Stack(
                  children: [
                    // Image
                    Container(
                      width: 382.w,
                      height: 109.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://www.uspace.id/wp-content/uploads/2022/03/bukti-transfer-m-banking-bca-asli..jpg",
                          ),
                          fit: BoxFit.none,
                        ),
                      ),
                    ),

                    // Button
                    Positioned(
                      top: (109.h - 24.h) /
                          2.h, // Mengatur posisi vertical tengah
                      left: (382.w - 24.w) /
                          2.w, // Mengatur posisi horizontal tengah
                      child: eyeButton(),
                    ),
                  ],
                ),
              ],
            ),

          if (isBayar == false)
            Column(
              children: [
                // Status
                const TextFieldRekapBulanan(
                    label: "Status", keterangan: "Belum Terbayar"),

                15.verticalSpace,

                // Total Iuran
                const TextFieldRekapBulanan(
                    label: "Total Iuran", keterangan: "RP 300.000"),
              ],
            )
        ],
      ),
    );
  }
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
            height: 35.h,
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
          top: (35.h - 26.h) / 2.h,
          left: (35.w - 26.w) / 2.w,
          child: SvgPicture.asset("assets/images/ic_eye_on_fill.svg",
              height: 26.h),
        ),
      ],
    ),
  );
}

class TextFieldRekapBulanan extends StatelessWidget {
  const TextFieldRekapBulanan({
    Key? key,
    required this.label,
    required this.keterangan,
  }) : super(key: key);

  final String label;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 38.w,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              readOnly: true,
              controller: TextEditingController(text: keterangan),
            ),
          ),
        ],
      ),
    );
  }
}

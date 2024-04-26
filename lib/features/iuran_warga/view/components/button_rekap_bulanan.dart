// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonRekapBulanan extends StatelessWidget {
  const ButtonRekapBulanan({
    Key? key,
    required this.header,
    this.amount,
    this.warga,
    this.isBayar = true,
  }) : super(key: key);

  final String header;
  final int? amount;
  final int? warga;
  final bool? isBayar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 181.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: (isBayar == true)
            ? const Color(0xFF27D18A)
            : const Color(0xFFD40202),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),

      // Row
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isBayar == true)
              ?
              // Icon
              SvgPicture.asset(
                  "assets/images/checkmark_circle_2.svg",
                  height: 25.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )
              : SvgPicture.asset(
                  "assets/images/cross_circle.svg",
                  height: 25.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),

          12.horizontalSpace,

          // Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text terbayar?
              Text(
                header,
                style: NunitoTextStyle.fw700.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),

              // Saldo
              Text(
                NumberFormat.currency(
                        locale: "id", decimalDigits: 0, symbol: "Rp ")
                    .format((amount != null) ? amount : 0),
                style: PoppinsTextStyle.fw700.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),

              // Warga
              Text(
                '$warga warga',
                style: NunitoTextStyle.fw400.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

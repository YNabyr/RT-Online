// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class ExpansionTileLaporanKeuangan extends StatefulWidget {
  const ExpansionTileLaporanKeuangan({
    Key? key,
    required this.children,
    required this.title,
    this.textStyle,
    this.amount,
  }) : super(key: key);

  final List<Widget> children;
  final String title;
  final TextStyle? textStyle;
  final int? amount;

  @override
  State<ExpansionTileLaporanKeuangan> createState() =>
      _ExpansionTileLaporanKeuanganState();
}

class _ExpansionTileLaporanKeuanganState
    extends State<ExpansionTileLaporanKeuangan> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                // Icon Image
                (!isExpanded)
                    ? SvgPicture.asset(
                        "assets/outline/arrow-ios-right.svg",
                        colorFilter: const ColorFilter.mode(
                            Color(0xff6454F0), BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        "assets/outline/arrow-ios-down.svg",
                        colorFilter: const ColorFilter.mode(
                            Color(0xff6454F0), BlendMode.srcIn),
                      ),

                8.horizontalSpace,

                // Bulan
                Text(
                  widget.title,
                  style: (widget.textStyle == null)
                      ? PoppinsTextStyle.fw600.copyWith(
                          color: const Color(0xFF6454F0),
                          fontSize: 20.sp,
                        )
                      : widget.textStyle,
                ),

                Expanded(child: Container()),

                // Nominal
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp. ")
                      .format((widget.amount != null) ? widget.amount : 0),
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: const Color(0xFF6454F0),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) // Content displayed when expanded
            Column(
              children: widget.children,
            ),
        ],
      ),
    );
  }
}

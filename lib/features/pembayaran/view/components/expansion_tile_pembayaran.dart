// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class ExpansionTilePembayaran extends StatefulWidget {
  const ExpansionTilePembayaran({
    Key? key,
    required this.child,
    required this.title,
    this.textStyle,
    this.isOpen,
  }) : super(key: key);

  final Widget child;
  final String title;
  final TextStyle? textStyle;
  final bool? isOpen;

  @override
  State<ExpansionTilePembayaran> createState() =>
      _ExpansionTilePembayaranState();
}

class _ExpansionTilePembayaranState extends State<ExpansionTilePembayaran> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                // Bulan
                Text(
                  widget.title,
                  style: (widget.textStyle == null)
                      ? NunitoTextStyle.fw800.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 14.sp,
                        )
                      : widget.textStyle,
                ),

                Expanded(child: Container()),

                // Icon Image
                (!isExpanded)
                    ? SvgPicture.asset("assets/outline/arrow-ios-right.svg")
                    : SvgPicture.asset("assets/outline/arrow-ios-down.svg"),
              ],
            ),
          ),
          if (isExpanded) // Content displayed when expanded
            widget.child,
        ],
      ),
    );
  }
}

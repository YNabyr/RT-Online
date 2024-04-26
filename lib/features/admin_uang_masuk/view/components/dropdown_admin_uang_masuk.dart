// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class DropdownAdminUangMasuk extends StatefulWidget {
  const DropdownAdminUangMasuk({
    Key? key,
    this.label,
    this.hintText,
    this.width,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final double? width;

  @override
  State<DropdownAdminUangMasuk> createState() => _DropdownAdminUangMasukState();
}

class _DropdownAdminUangMasukState extends State<DropdownAdminUangMasuk> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        (widget.label != null)
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  widget.label!,
                  textAlign: TextAlign.start,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              )
            : Container(),

        Container(
          width: (widget.width == null) ? 382.w : widget.width,
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(4, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: widget.hintText,
              hintStyle: NunitoTextStyle.fw400.copyWith(
                color: const Color(0xFF9597A3),
                fontSize: 13.sp,
              ),
            ),
            icon: const ImageIcon(
              AssetImage("assets/images/ic_arrow_ios_down.png"),
              color: Color(0xff9597A3),
            ),
            onChanged: (value) {
              setState(() {
                (value == null) ? widget.hintText : selectedValue = value;
              });
            },
            items: ['Option 1', 'Option 2', 'Option 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 13.sp,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

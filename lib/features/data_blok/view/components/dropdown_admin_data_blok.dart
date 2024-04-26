// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/models/blok.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class DropdownAdminDataBlok extends StatefulWidget {
  const DropdownAdminDataBlok({
    Key? key,
    this.label,
    this.hintText,
    this.width,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final double? width;

  @override
  State<DropdownAdminDataBlok> createState() => _DropdownAdminDataBlokState();
}

class _DropdownAdminDataBlokState extends State<DropdownAdminDataBlok> {
  Blok? selectedValue;

  var controller = DataBlokController();

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
          child: Obx(
            () => DropdownButtonFormField<Object>(
                isExpanded: true, // Added this line
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
                  color: Color(0xff0B0C0D),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as Blok?;
                  });
                },
                items: DataBlokController.to.listBlok
                    .map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                      child: SizedBox(
                    child: Text(e['name']!),
                  ));
                }).toList()),
          ),
        ),
      ],
    );
  }
}

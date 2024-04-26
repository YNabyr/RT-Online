// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/widgets/custom_dropdown_button2.dart';

class DropdownAdminGeneral extends StatelessWidget {
  const DropdownAdminGeneral({
    Key? key,
    this.label,
    required this.hint,
    this.value,
    required this.dropdownItems,
    this.onChanged,
    this.icon,
    this.width,
    this.onTap,
    this.onMenuStateChange,
    this.dropdownHeight,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? value;
  final List<String> dropdownItems;
  final void Function(String?)? onChanged;
  final Widget? icon;
  final double? width;
  final void Function()? onTap;
  final Function(bool)? onMenuStateChange;
  final double? dropdownHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        (label != null)
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  label!,
                  textAlign: TextAlign.start,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              )
            : Container(),

        SizedBox(
          width: width ?? 382.w,
          height: 42.h,
          child: CustomDropdownButton2(
            dropdownHeight: dropdownHeight,
            onMenuStateChange: onMenuStateChange,
            icon: icon,
            hint: hint ?? '',
            value: value,
            dropdownItems: dropdownItems,
            onChanged: onChanged,
            buttonDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 8,
                  offset: Offset(4, 3),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

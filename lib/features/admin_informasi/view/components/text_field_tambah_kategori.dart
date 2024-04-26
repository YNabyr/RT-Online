// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldTambahKategori extends StatelessWidget {
  const TextFieldTambahKategori({
    Key? key,
    this.isObscure = false,
    this.label,
    this.suffixIcon,
    this.hint,
    this.textInputType,
    this.onTapClose,
    this.controller,
  }) : super(key: key);

  final bool isObscure;
  final String? label;
  final IconData? suffixIcon;
  final String? hint;
  final TextInputType? textInputType;
  final void Function()? onTapClose;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          if (label != null)
            Text(
              label!,
              style: NunitoTextStyle.fw700.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 14.sp,
              ),
            ),

          // Container
          Container(
            child: Row(
              children: [
                Expanded(
                  // Textfield
                  child: TextField(
                    obscureText: isObscure,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF9597A3),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                // Button
                (suffixIcon != null)
                    ? GestureDetector(
                        onTap: onTapClose,
                        child: const Icon(Icons.close_rounded),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

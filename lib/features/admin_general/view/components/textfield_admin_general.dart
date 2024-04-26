// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldAdminGeneral extends StatelessWidget {
  const TextFieldAdminGeneral({
    Key? key,
    this.readOnly = true,
    required this.label,
    this.labelText,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onTapSuffixIcon,
    this.isObscure = false,
    this.isExpanded = false,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.isEdit = false,
    this.width,
    this.close,
  }) : super(key: key);

  final bool readOnly;
  final String label;
  final String? labelText;
  final String? hint;
  final String? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final void Function()? onTapSuffixIcon;
  final bool isObscure;
  final bool isExpanded;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool? isEdit;
  final double? width;
  final bool? close;

  @override
  Widget build(BuildContext context) {
    // Container

    return SizedBox(
      width: (width == null) ? 382.w : width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: NunitoTextStyle.fw700.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 14.sp,
                ),
              ),
              (close == true)
                  ? Icon(
                      Icons.close_rounded,
                      size: 15.w,
                    )
                  : Container()
            ],
          ),

          // Background
          Container(
            width: 382.w,
            height: 40.h,
            margin: (isEdit == true) ? EdgeInsets.only(top: 8.h) : null,
            decoration: (isEdit == true)
                ? ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(4, 3),
                        spreadRadius: 0,
                      )
                    ],
                  )
                : const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1),
                    ),
                  ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),

              // TextField
              child: Row(
                children: [
                  // Textfield
                  Expanded(
                    child: TextField(
                      maxLines: maxLines,
                      expands: isExpanded,
                      keyboardType: keyboardType,
                      obscureText: isObscure,
                      controller: controller,
                      readOnly: (isEdit == true) ? false : readOnly,
                      minLines: minLines,
                      onChanged: (text) {
                        controller?.text = text;
                      },
                      style: NunitoTextStyle.fw400.copyWith(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                      decoration: InputDecoration(
                        labelText: labelText,
                        hintText: hint,
                        border: InputBorder.none,
                        hintStyle: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF9597A3),
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),

                  // Icon
                  (suffixIcon != null)
                      ? GestureDetector(
                          onTap: onTapSuffixIcon,
                          child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(
                              suffixIcon!,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

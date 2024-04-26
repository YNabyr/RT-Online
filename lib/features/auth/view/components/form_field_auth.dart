// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class FormFieldAuth extends StatelessWidget {
  const FormFieldAuth({
    Key? key,
    this.isReadOnly = false,
    required this.label,
    this.labelText,
    required this.hint,
    this.suffixIcon,
    this.prefixIcon,
    required this.keyboardType,
    this.isPassword = false,
    this.onTapSuffixIcon,
    this.isObscure = false,
    this.isExpanded = false,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  final bool isReadOnly;
  final String label;
  final String? labelText;
  final String hint;
  final String? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final void Function()? onTapSuffixIcon;
  final bool isObscure;
  final bool isExpanded;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    // Container

    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Label
          Text(
            label,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 13.sp,
            ),
          ),

          // Background
          Container(
            margin: EdgeInsets.only(top: 8.w),
            width: 382.w,
            decoration: ShapeDecoration(
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
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),

              // TextFormField
              child: Row(
                children: [
                  // TextFormField
                  Expanded(
                    child: TextFormField(
                      maxLines: maxLines,
                      expands: isExpanded,
                      keyboardType: keyboardType,
                      obscureText: isObscure,
                      controller: controller,
                      readOnly: isReadOnly,
                      onChanged: (text) {
                        controller?.text = text;
                      },
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
                            height: 20.w,
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

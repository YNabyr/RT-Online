// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldAdminHakAkses extends StatelessWidget {
  const TextFieldAdminHakAkses({
    Key? key,
    this.readOnly = true,
    this.label,
    this.labelText,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onTapPreffixIcon,
    this.onTapSuffixIcon,
    this.onTapIcDelete,
    this.isObscure = false,
    this.isExpanded = false,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.border = false,
    this.width,
    this.close,
    this.icDelete = false,
    this.icPreffix,
    this.hintColor,
  }) : super(key: key);

  final bool readOnly;
  final String? label;
  final String? labelText;
  final String? hint;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final void Function()? onTapPreffixIcon;
  final void Function()? onTapSuffixIcon;
  final void Function()? onTapIcDelete;
  final bool isObscure;
  final bool isExpanded;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool? border;
  final double? width;
  final bool? close;
  final bool? icDelete;
  final bool? icPreffix;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    // Container

    return SizedBox(
      width: (width == null) ? 382.w : width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (label == null)
              ? Container()
              :
              // Text Label
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label!,
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
            margin: (border == false) ? EdgeInsets.only(top: 8.h) : null,
            decoration: (border == false)
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
            child: Padding(
              padding: (icDelete == true)
                  ? EdgeInsets.only(
                      left: 12.w,
                      top: 4.h,
                      bottom: 4.h,
                      right: 0,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),

              // TextField
              child: Row(
                children: [
                  (icPreffix == false)
                      ? Container()
                      :
                      // preffix Icon
                      GestureDetector(
                          onTap: onTapPreffixIcon,
                          child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child:
                                SvgPicture.asset("assets/outline/person.svg"),
                          ),
                        ),

                  (icPreffix == false) ? Container() : 12.horizontalSpace,

                  // Textfield
                  Expanded(
                    child: TextField(
                      maxLines: maxLines,
                      expands: isExpanded,
                      keyboardType: keyboardType,
                      obscureText: isObscure,
                      controller: controller,
                      readOnly: readOnly,
                      minLines: minLines,
                      onChanged: (text) {
                        controller?.text = text;
                      },
                      decoration: InputDecoration(
                        labelText: labelText,
                        hintText: hint,
                        border: InputBorder.none,
                        hintStyle: NunitoTextStyle.fw400.copyWith(
                          color: (hintColor != null)
                              ? hintColor
                              : const Color(0xFF0B0C0D),
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
                            child: SvgPicture.asset(
                              suffixIcon!,
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                            ),
                          ),
                        )
                      : Container(),

                  (icDelete == true) ? 12.horizontalSpace : Container(),

                  // delete
                  (icDelete == true)
                      ? GestureDetector(
                          onTap: onTapIcDelete,
                          child: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: SvgPicture.asset(
                                "assets/outline/trash-2.svg",
                                colorFilter: const ColorFilter.mode(
                                    Color(0xffD40202), BlendMode.srcIn),
                              )),
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

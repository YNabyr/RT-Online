// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldAdminIuran extends StatelessWidget {
  const TextFieldAdminIuran({
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
    this.onTapIcClose,
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
    this.nominal = false,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
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
  final void Function()? onTapIcClose;
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
  final bool? nominal;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;

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
                        ? GestureDetector(
                            onTap: onTapIcClose,
                            child: Icon(
                              Icons.close_rounded,
                              size: 15.w,
                            ),
                          )
                        : Container()
                  ],
                ),
          (nominal == false)
              ?
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
                                  child: Image.asset(
                                    "assets/images/ic_person.png",
                                  ),
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
                                    : const Color(0xFF9597A3),
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
                                  child: Image.asset(suffixIcon!,
                                      color: Colors.black),
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
                                  child: Image.asset(
                                    "assets/images/ic_trash_2.png",
                                    color: const Color(0xffD40202),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
              :

              // Nominal
              Stack(
                  children: [
                    // Container
                    Container(
                      width: 382.w,
                      height: 40.h,
                      margin:
                          (border == false) ? EdgeInsets.only(top: 8.h) : null,
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
                            38.horizontalSpace,

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
                                onSubmitted: onSubmitted,
                                onEditingComplete: onEditingComplete,
                                onChanged: (onChanged == null)
                                    ? (text) {
                                        controller?.text = text;
                                      }
                                    : onChanged,
                                decoration: InputDecoration(
                                  labelText: labelText,
                                  hintText: hint,
                                  border: InputBorder.none,
                                  hintStyle: NunitoTextStyle.fw400.copyWith(
                                    color: (hintColor != null)
                                        ? hintColor
                                        : const Color(0xFF9597A3),
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
                                      child: Image.asset(suffixIcon!,
                                          color: Colors.black),
                                    ),
                                  )
                                : Container(),

                            (icDelete == true)
                                ? 12.horizontalSpace
                                : Container(),

                            // delete
                            (icDelete == true)
                                ? GestureDetector(
                                    onTap: onTapIcDelete,
                                    child: SizedBox(
                                      width: 20.w,
                                      height: 20.h,
                                      child: Image.asset(
                                        "assets/images/ic_trash_2.png",
                                        color: const Color(0xffD40202),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),

                    // Rp
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF094181),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(2, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Rp',
                            style: NunitoTextStyle.fw800.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextFieldEditProfile extends StatefulWidget {
  const TextFieldEditProfile({
    Key? key,
    this.defaultText,
    this.isObscure = false,
    this.label,
    this.icon,
    this.hint,
    this.textInputType,
    this.controller,
    this.onTap,
    this.colorFilter,
  }) : super(key: key);

  final String? defaultText;
  final bool isObscure;
  final String? label;
  final String? icon;
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  @override
  _TextFieldEditProfileState createState() => _TextFieldEditProfileState();
}

class _TextFieldEditProfileState extends State<TextFieldEditProfile> {
  late bool _isObscure;
  late String _currentText;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
    _currentText = widget.defaultText ?? ''; // Use defaultText if provided
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          if (widget.label != null)
            Text(
              widget.label!,
              style: NunitoTextStyle.fw700.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 13.sp,
              ),
            ),

          // Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  // Textfield
                  child: TextField(
                    obscureText: _isObscure,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    onChanged: (value) {
                      setState(() {
                        _currentText = value;
                      });

                      // Check if the entered text matches a certain condition
                      if (_currentText == "your_condition_here" &&
                          widget.isObscure == true) {
                        // Perform your logic here
                        // For example, change obscureText or update icon
                        _isObscure = !_isObscure;
                        if (widget.onTap != null) {
                          widget.onTap!();
                        }
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF9597A3),
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),

                // Button
                GestureDetector(
                  onTap: (widget.onTap != null)
                      ? widget.onTap
                      : () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                  child: (widget.icon != null && widget.isObscure == false)
                      ? SvgPicture.asset(
                          widget.icon!,
                          colorFilter: widget.colorFilter,
                        )
                      : (widget.icon == null && widget.isObscure == true)
                          ? SvgPicture.asset(_isObscure
                              ? "assets/outline/eye.svg"
                              : "assets/outline/eye-off.svg")
                          : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

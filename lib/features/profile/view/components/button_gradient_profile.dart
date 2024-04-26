// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ButtonGradientProfile extends StatelessWidget {
  const ButtonGradientProfile({
    Key? key,
    required this.text,
    required this.onPressed,
    this.plainColor,
    this.suffixIcon,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final Color? plainColor;
  final String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          decoration: (plainColor == null)
              ? BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF6EE2F5),
                      Color(0xFF6454F0),
                    ], // Sesuaikan dengan warna yang diinginkan
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                )
              : BoxDecoration(
                  color: plainColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
          child: (suffixIcon == null)
              ? Container(
                  width: 382.w,
                  height: 54.w,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16)
                          .w,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 382.w,
                  height: 54.w,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16)
                          .w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.horizontalSpace,
                      SvgPicture.asset(suffixIcon!),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

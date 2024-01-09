// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonIuran extends StatelessWidget {
  const ButtonIuran({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: 350.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(4, 3),
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ],
        ),
        child: SizedBox(
          height: 30.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              SizedBox(
                width: 30.w,
                child: const ImageIcon(
                  AssetImage("assets/images/ic_tertib_fill.png"),
                  color: Color(0xff6454F0),
                ),
              ),

              // Text
              SizedBox(
                width: 278.w - 32.w,
                child: Text(
                  title,
                  style: NunitoTextStyle.fw500.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
              ),

              // Button Icon
              SizedBox(
                width: 24.w,
                child: const ImageIcon(
                  AssetImage("assets/images/ic_arrow_ios_right.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

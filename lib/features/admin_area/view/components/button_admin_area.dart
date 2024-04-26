// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class ButtonAdminArea extends StatelessWidget {
  const ButtonAdminArea({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 382.w,
        height: 56.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 8,
              offset: Offset(4, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // text
            Text(
              text,
              style: NunitoTextStyle.fw500.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 16.sp,
              ),
            ),

            // Icon
            const ImageIcon(AssetImage("assets/images/ic_arrow_ios_right.png"))
          ],
        ),
      ),
    );
  }
}

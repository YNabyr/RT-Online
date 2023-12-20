// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TopBarPreviewKas extends StatelessWidget {
  const TopBarPreviewKas({
    Key? key,
    this.onTapLeft,
    this.onTapRight,
    this.text,
  }) : super(key: key);

  final void Function()? onTapLeft;
  final void Function()? onTapRight;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 42.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Button Left
          GestureDetector(
            onTap: onTapLeft,
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 20.w,
            ),
          ),

          // Text
          Expanded(
            child: (text != null)
                ? Text(
                    textAlign: TextAlign.center,
                    text!,
                    style: NunitoTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  )
                : const Text("null"),
          ),

          // Button Right
          GestureDetector(
            onTap: onTapRight,
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}

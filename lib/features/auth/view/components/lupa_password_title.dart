// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/google_text_style.dart';

class LupaPasswordTitle extends StatelessWidget {
  const LupaPasswordTitle({
    Key? key,
    this.text,
    required this.title,
  }) : super(key: key);

  final String? text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          width: 382.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text
              Text(
                title,
                style: PoppinsTextStyle.fw600.copyWith(
                  color: const Color(0xFF1F1F1F),
                  fontSize: 20.sp,
                ),
              ),

              20.verticalSpace,

              (text != null)
                  // Text
                  ? Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF1F1F1F),
                        fontSize: 13.sp,
                        height: 1.4,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

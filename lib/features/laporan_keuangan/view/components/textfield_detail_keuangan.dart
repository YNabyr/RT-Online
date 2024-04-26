import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class TextfieldDetailKeuangan extends StatelessWidget {
  const TextfieldDetailKeuangan({
    Key? key,
    required this.label,
    required this.keterangan,
  }) : super(key: key);

  final String label;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: NunitoTextStyle.fw700.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            height: 38.w,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              readOnly: true,
              controller: TextEditingController(text: keterangan),
            ),
          ),
        ],
      ),
    );
  }
}

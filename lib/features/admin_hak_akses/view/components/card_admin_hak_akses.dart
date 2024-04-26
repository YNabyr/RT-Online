// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/pembayaran/view/components/checkbox_pembayaran_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox_2.dart';

class CardAdminHakAkses extends StatelessWidget {
  const CardAdminHakAkses({
    Key? key,
    required this.text,
    required this.isChecked,
    this.onChange,
  }) : super(key: key);

  final String text;
  final bool isChecked;
  final Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 48.h,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Row(
        children: [
          // Container(
          //   width: 24.w,
          //   height: 24.h,
          //   clipBehavior: Clip.antiAlias,
          //   decoration: ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       side: const BorderSide(width: 1, color: Color(0xFFB5B7C4)),
          //       borderRadius: BorderRadius.circular(6),
          //     ),
          //   ),
          // ),
          CheckboxPembayaran(
            isChecked: isChecked,
            onChange: onChange,
          ),

          12.horizontalSpace,
          Text(
            text,
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}

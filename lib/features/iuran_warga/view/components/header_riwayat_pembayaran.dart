// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';

class HeaderRiwayatPembayaran extends StatelessWidget {
  const HeaderRiwayatPembayaran({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    // Container Row

    return SizedBox(
      width: 382.w,
      child: Row(
        children: [
          // Icon
          const ImageIcon(
            AssetImage("assets/images/ic_arrow_ios_down.png"),
          ),

          15.horizontalSpace,

          // Tanggal
          Text(
            date,
            style: NunitoTextStyle.fw400.copyWith(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),

          15.horizontalSpace,

          // Divider

          const Expanded(
            child: Divider(
              thickness: 2,
              color: Color(0xFF838383),
            ),
          ),
        ],
      ),
    );
  }
}

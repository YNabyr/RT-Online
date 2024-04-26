// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_expansion_tile.dart';

class CardAdminUangMasuk extends StatefulWidget {
  const CardAdminUangMasuk({
    Key? key,
    required this.amount,
    this.onTap,
    this.isBayar = false,
  }) : super(key: key);

  final int amount;
  final void Function()? onTap;
  final bool? isBayar;

  @override
  State<CardAdminUangMasuk> createState() => _CardAdminUangMasukState();
}

class _CardAdminUangMasukState extends State<CardAdminUangMasuk> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 382.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 8,
              offset: Offset(4, 3),
              spreadRadius: 0,
            )
          ],
        ),

        // Row Image profile, nama, button, nominal
        child: Column(
          children: [
            Row(
              children: [
                // Image Profile
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Container
                    Container(
                      padding: EdgeInsets.all(8.w),
                      width: 66.w,
                      height: 66.h,

                      // Profile Image
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/57/a0/33/57a033a6286934d52087b6f54c697e09.jpg"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),

                    // Blok
                    Positioned(
                      bottom: 4.h,
                      child: Container(
                        width: 35.w,
                        height: 14.h,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF094181),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            "C-9",
                            style: NunitoTextStyle.fw600.copyWith(
                              color: const Color(0xFFE2DDFE),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                8.horizontalSpace,

                // Column Nama, tgl
                Expanded(
                  child: SizedBox(
                    width: 144.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmad Sujadi',
                          style: NunitoTextStyle.fw700.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 16.sp,
                          ),
                        ),

                        // tgl
                        Text(
                          '30 Okt 2023, 09:00',
                          style: NunitoTextStyle.fw400.copyWith(
                            color: const Color(0xFF0B0C0D),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Column Button, nominal
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format((widget.amount != null) ? widget.amount : 0),
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/styles/google_text_style.dart';

class TableRekapTahunan extends StatelessWidget {
  const TableRekapTahunan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 18,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            buildHeaderRow(),

            // Warga
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: false),
            buildWargaRow(isLast: true),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderRow() {
    return Container(
      width: 382.w,
      decoration: const BoxDecoration(
        color: Color(0xffeff0f5),
        border: Border(
          left: BorderSide(
            color: Color(0xFFE0E2EB),
            width: 1,
          ),
          top: BorderSide(
            color: Color(0xFFE0E2EB),
            width: 1,
          ),
          right: BorderSide(
            color: Color(0xFFE0E2EB),
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildHeaderTextCell('Warga'),
          8.horizontalSpace,
          buildTextBulan(text: "Jan"),
          buildTextBulan(text: "Feb"),
          buildTextBulan(text: "Mar"),
          buildTextBulan(text: "Apr"),
          buildTextBulan(text: "May"),
          buildTextBulan(text: "Jun"),
          buildTextBulan(text: "Jul"),
          buildTextBulan(text: "Aug"),
          buildTextBulan(text: "Sep"),
          buildTextBulan(text: "Okt"),
          buildTextBulan(text: "Nov"),
          buildTextBulan(text: "Des"),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget buildHeaderTextCell(String text) {
    return Container(
      width: 64.w,
      height: 42.h,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xFFE0E2EB),
            width: 1,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: NunitoTextStyle.fw800.copyWith(
            color: const Color(0xFF0B0C0D),
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  Widget buildWargaRow({bool? isLast = false}) {
    return Container(
      width: 382.w,
      decoration: BoxDecoration(
        borderRadius: isLast == true
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            : null,
        border: Border.all(
          width: 1,
          color: const Color(0xFFE0E2EB),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildWargaImageCell(),
          8.horizontalSpace,
          buildIconRekapTahunan(paymentStatus: "terbayar"),
          buildIconRekapTahunan(paymentStatus: "terbayar"),
          buildIconRekapTahunan(paymentStatus: "terbayar"),
          buildIconRekapTahunan(paymentStatus: "terbayar"),
          buildIconRekapTahunan(paymentStatus: "belumTerbayar"),
          buildIconRekapTahunan(paymentStatus: "belumTerbayar"),
          buildIconRekapTahunan(),
          buildIconRekapTahunan(),
          buildIconRekapTahunan(),
          buildIconRekapTahunan(),
          buildIconRekapTahunan(),
          buildIconRekapTahunan(),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget buildWargaImageCell() {
    return Container(
      width: 64.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xFFE0E2EB),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Container(
              width: 31.w,
              height: 31.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/564x/57/a0/33/57a033a6286934d52087b6f54c697e09.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4.h,
            child: Container(
              height: 11.h,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: ShapeDecoration(
                color: const Color(0xFF094181),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Center(
                child: Text(
                  "C-9",
                  style: NunitoTextStyle.fw600.copyWith(
                    color: const Color(0xFFE2DDFE),
                    fontSize: 8.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconRekapTahunan({String? paymentStatus}) {
    switch (paymentStatus) {
      case 'terbayar':
        return ClipOval(
          child: SvgPicture.asset(
            "assets/fill/ic_checkmark-circle.svg",
          ),
        );
      case 'belumTerbayar':
        return ClipOval(
          child: SvgPicture.asset(
            "assets/fill/close-circle.svg",
          ),
        );
      default:
        return ClipOval(
          child: Container(
            width: 18.w,
            height: 18.h,
            color: const Color(0xFFD9D9D9),
          ),
        );
    }
  }

  Text buildTextBulan({required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: NunitoTextStyle.fw800.copyWith(
        color: (color == null) ? const Color(0xFF6454F0) : color,
        fontSize: 10.sp,
      ),
    );
  }
}

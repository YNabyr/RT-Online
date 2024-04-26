import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetRiwayatEditIuran extends StatelessWidget {
  const BottomSheetRiwayatEditIuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      padding: EdgeInsets.only(
        top: 12.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h,
      ),
      child: Column(
        children: [
          // bar
          Container(
            width: 100.w,
            height: 5.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          15.verticalSpace,
          Text(
            'Riwayat Edit',
            textAlign: TextAlign.center,
            style: PoppinsTextStyle.fw600.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
          15.verticalSpace,

          buildContent(),
          buildContent(),
          buildContent(detail: 'Penyusutan Iuran Rp 50.000'),
          buildContent(detail: 'Kenaikan Iuran Rp 150.000'),
          buildContent(isLast: true, isIcAdd: true),
        ],
      ),
    );
  }

  Row buildContent({
    bool? isLast = false,
    String? detail,
    bool? isIcAdd = false,
  }) {
    // Row Content
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Column
        SizedBox(
          width: 64.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '11 Okt 22',
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 13.sp,
                ),
              ),
              Text(
                '14:00',
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),

        // circle
        Column(
          children: [
            // Container
            Container(
              width: 40.w,
              height: 40.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(54),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    (isIcAdd == true)
                        ? "assets/outline/file-add.svg"
                        : "assets/outline/edit-2.svg",
                  ),
                ),
              ),
            ),

            (isLast == false)
                ?
                // divider
                SizedBox(
                    height: 15.h,
                    child: const VerticalDivider(
                      color: Colors.black,
                    ),
                  )
                : Container(),
          ],
        ),

        // Columnn Row Keterangan
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row
            Row(
              children: [
                // Text
                Text(
                  'Diubah Oleh',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                8.horizontalSpace,

                Text(
                  'Krisna Maulana',
                  style: NunitoTextStyle.fw600.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),

            (detail == null)
                ? Container()
                :
                // detail
                Text(
                    detail,
                    style: NunitoTextStyle.fw300.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 13.sp,
                    ),
                  ),
          ],
        )
      ],
    );
  }
}

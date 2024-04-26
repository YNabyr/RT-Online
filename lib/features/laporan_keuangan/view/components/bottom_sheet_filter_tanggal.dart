import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class BottomSheetFilterTanggal extends StatefulWidget {
  const BottomSheetFilterTanggal({super.key});

  @override
  State<BottomSheetFilterTanggal> createState() =>
      _BottomSheetFilterTanggalState();
}

class _BottomSheetFilterTanggalState extends State<BottomSheetFilterTanggal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // bar
          Container(
            width: 100.w,
            height: 5.w,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B0C0D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),

          15.verticalSpace,

          // Filter Tanggal
          Text(
            'Filter Tanggal',
            style: PoppinsTextStyle.fw600.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 20.sp,
            ),
          ),

          // Calendar
          SfCalendar(
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: NunitoTextStyle.fw800.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 13.sp,
              ),
            ),
            headerDateFormat: "MMMM",
            headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: NunitoTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 16.sp,
              ),
            ),
            cellBorderColor: Colors.white,
            blackoutDatesTextStyle: NunitoTextStyle.fw800.copyWith(
              color: const Color(0xFFD40202),
              fontSize: 13.sp,
            ),
            timeZone: "SE Asia Standard Time",
            view: CalendarView.month,
            monthViewSettings: MonthViewSettings(
              dayFormat: "EEE",
              showTrailingAndLeadingDates: false,
              monthCellStyle: MonthCellStyle(
                textStyle: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF0B0C0D),
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),

          // Field
          Container(
            width: 382.w,
            height: 36.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFEFF0F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    'Tahun Ini',
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF3E3F44),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          15.verticalSpace,

          // Field
          Container(
            width: 382.w,
            height: 36.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFEFF0F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    'Tahun Lalu',
                    style: NunitoTextStyle.fw700.copyWith(
                      color: const Color(0xFF3E3F44),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          15.verticalSpace,

          // Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // button batal
              OutlinedButton(
                style: ButtonStyle(
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(184.w, 54.w),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Batal',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF6454F0),
                    fontSize: 16.sp,
                  ),
                ),
              ),
              // button simpan
              FilledButton(
                style: ButtonStyle(
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(184.w, 54.w),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Simpan',
                  style: NunitoTextStyle.fw700.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

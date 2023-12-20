import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class SearchBarDataWarga extends StatelessWidget {
  const SearchBarDataWarga({super.key});

  @override
  Widget build(BuildContext context) {
    // Container
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(4, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
        width: 358.w,
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Icon
              const Icon(
                Icons.search_rounded,
              ),

              // Divider
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
                height: 25.w,
                child: const VerticalDivider(
                  thickness: 1,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              // Text Field
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Tetanggamu disini',
                    hintStyle: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFFB5B7C4),
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

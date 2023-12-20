import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ProfileAuth extends StatelessWidget {
  const ProfileAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 170.w,
          height: 170.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150.w,
                  height: 150.w,
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    width: 134.w,
                    height: 134.w,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/564x/7f/14/99/7f1499ff9238b37050f1050587947a20.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),

              // Id Rectangle
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 54.w,
                  height: 26.w,
                  margin: EdgeInsets.only(bottom: 7.w),
                  decoration: ShapeDecoration(
                    color: const Color(0xff094282),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text
                      Text(
                        'C-23',
                        style: NunitoTextStyle.fw700.copyWith(
                          color: const Color(0xFFE2DDFE),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

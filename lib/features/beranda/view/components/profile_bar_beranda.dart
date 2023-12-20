// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ProfileBarBeranda extends StatelessWidget {
  const ProfileBarBeranda({
    Key? key,
    this.iconPressed,
    this.onTapProfile,
  }) : super(key: key);

  final void Function()? iconPressed;
  final void Function()? onTapProfile;

  @override
  Widget build(BuildContext context) {
    // Container
    return SizedBox(
      width: 382.w,
      height: 78.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          GestureDetector(
            onTap: onTapProfile,
            child: Container(
              margin: EdgeInsets.all(10.w),
              width: 58.w,
              height: 58.w,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/7f/14/99/7f1499ff9238b37050f1050587947a20.jpg"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
          ),

          12.horizontalSpace,

          // Text Nama | Alamat
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama
                Text(
                  'Krisna Maulana',
                  style: PoppinsTextStyle.fw600.copyWith(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),

                4.verticalSpace,

                // Alamat
                Text(
                  'Perumahan Griya Shanta C-23',
                  style: NunitoTextStyle.fw800.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

          // Button Setting
          Padding(
            padding: EdgeInsets.only(top: 5.w, right: 3.w),
            child: IconButton(
              onPressed: iconPressed,
              icon: const ImageIcon(
                color: Colors.white,
                AssetImage("assets/images/ic_settings_2.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class EmptyAdminPengumuman extends StatelessWidget {
  const EmptyAdminPengumuman({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 283.w,
      child: Column(
        children: [
          // image
          SizedBox(
            width: 283.w,
            child: Image.asset(
              "assets/images/empty_admin_pengumuman.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          // text
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              'Belum ada Data Informasi',
              textAlign: TextAlign.center,
              style: PoppinsTextStyle.fw600.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 20.sp,
              ),
            ),
          ),

          // text
          Text(
            'Mohon ditambahkan data untuk melihat informasi.',
            textAlign: TextAlign.center,
            style: NunitoTextStyle.fw400.copyWith(
              color: const Color(0xFF0B0C0D),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

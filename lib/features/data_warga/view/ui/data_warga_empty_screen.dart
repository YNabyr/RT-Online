import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_warga/view/components/header_data_warga.dart';
import 'package:venturo_core/features/data_warga/view/components/search_bar_data_warga.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DataWargaEmptyScreen extends StatelessWidget {
  const DataWargaEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Stack
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 135.w,
              ),
              // Topbar
              const HeaderDataWarga(text: "Data Warga"),

              // Search Bar
              const Positioned(bottom: 0, child: SearchBarDataWarga()),
            ],
          ),

          112.verticalSpace,

          // Box
          SizedBox(
            width: 283.w,
            child: Column(
              children: [
                // Image
                Image.asset("assets/images/empty_data_warga.png"),

                // Text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.w),
                  child: Text(
                    'Belum ada Data Warga',
                    textAlign: TextAlign.center,
                    style: PoppinsTextStyle.fw500.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 20.sp,
                    ),
                  ),
                ),

                // Text
                SizedBox(
                  width: 283.w,
                  child: Text(
                    'Silahkan hubungi Admin untuk menambahkan data',
                    textAlign: TextAlign.center,
                    style: NunitoTextStyle.fw400.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

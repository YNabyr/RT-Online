import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/dashboard/controllers/dashboard_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: Obx(
          () => DashboardController
              .to.main[DashboardController.to.currentIndex.value],
        ),
        bottomNavigationBar: Obx(
          () => Container(
            height: 80.w,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 8,
                  offset: Offset(0, -4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildNavItem(
                          0, DashboardController.to.icon, 'Beranda'),
                    ),
                    Expanded(
                      child: _buildNavItem(
                          1, DashboardController.to.icon, 'Tata Tertib'),
                    ),
                    Expanded(
                      child: _buildNavItem(
                          2, DashboardController.to.icon, 'Iuran Warga'),
                    ),
                    Expanded(
                      child: _buildNavItem(
                          3, DashboardController.to.icon, 'Struktur RT'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, List<List<String>> icon, String title) {
    String normalIcon =
        icon[index][0]; // Menggunakan indeks 0 untuk normal icon
    String filledIcon =
        icon[index][1]; // Menggunakan indeks 1 untuk filled icon

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        // Aksi yang dijalankan saat item navigasi ditekan
        DashboardController.to.changePage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          (DashboardController.to.currentIndex.value == index)
              ? ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFF6EE2F5),
                        Color(0xFF6454F0),
                      ],
                    ).createShader(bounds);
                  },
                  child: ImageIcon(
                    AssetImage(filledIcon),
                  ),
                )
              : ImageIcon(
                  AssetImage(normalIcon),
                  color: Colors.grey,
                ),

          (DashboardController.to.currentIndex.value == index)
              ?
              // Text
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFF6EE2F5),
                        Color(0xFF6454F0),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    title,
                    style: NunitoTextStyle.fw600.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                )
              : Text(
                  title,
                  style: NunitoTextStyle.fw600.copyWith(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
        ],
      ),
    );
  }
}

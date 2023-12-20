import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/dashboard/controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Obx(() => DashboardController
          .to.main[DashboardController.to.currentIndex.value]),
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildNavItem(
                        0, "assets/images/ic_home.png", 'Beranda'),
                  ),
                  Expanded(
                    child: _buildNavItem(
                        1, "assets/images/ic_tertib.png", 'Tata Tertib'),
                  ),
                  Expanded(
                    child: _buildNavItem(
                        2, "assets/images/ic_iuran.png", 'Iuran Warga'),
                  ),
                  Expanded(
                    child: _buildNavItem(
                        3, "assets/images/ic_struktur.png", 'Struktur RT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String title) {
    return InkWell(
      onTap: () {
        // Aksi yang dijalankan saat item navigasi ditekan
        DashboardController.to.changePage(index);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
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
                      AssetImage(icon),
                    ),
                  )
                : ImageIcon(
                    AssetImage(icon),
                    color: Colors.grey,
                  ),

            // Text
            Text(
              title,
              style: TextStyle(
                color: DashboardController.to.currentIndex.value == index
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_list.dart';
import 'package:venturo_core/features/informasi/view/components/top_bar_informasi.dart';
import 'package:venturo_core/features/informasi/view/ui/empty_tata_tertib_screen.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_screen.dart';

class TataTertibListScreen extends StatelessWidget {
  const TataTertibListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarInformasi(),

          32.verticalSpace,

          (isEmpty == false)
              ?
              // Tatib List
              Column(
                  children: [
                    TatibList(
                      onTap: () {
                        Get.to(const TataTertibScreen());
                      },
                    ),
                    15.verticalSpace,
                    const TatibList(),
                  ],
                )
              : Column(
                  children: [
                    130.verticalSpace,
                    // Empty Tata Tertib
                    const EmptyTataTertibScreen(),
                  ],
                ),
        ],
      ),
    );
  }
}

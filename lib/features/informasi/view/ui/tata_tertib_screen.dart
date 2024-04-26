// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_card.dart';
import 'package:venturo_core/features/informasi/view/components/top_bar_informasi.dart';

class TataTertibScreen extends StatelessWidget {
  const TataTertibScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Top Bar Informasi
          const TopBarInformasi(title: "Tata Tertib"),

          // Card Tata Tertib
          32.verticalSpace,
          Container(
            padding: EdgeInsets.all(12.w),
            width: 358.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(4, 5),
                  color: Color.fromRGBO(0, 0, 0, 0.10),
                )
              ],
            ),
            child: const Column(
              children: [
                TatibCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

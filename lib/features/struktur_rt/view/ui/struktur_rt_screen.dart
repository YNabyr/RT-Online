import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/struktur_rt/constants/struktur_rt_assets_constant.dart';
import 'package:venturo_core/features/struktur_rt/view/components/empty_struktur_rt.dart';
import 'package:venturo_core/features/struktur_rt/view/components/top_bar_struktur_rt.dart';

class StrukturRtScreen extends StatelessWidget {
  StrukturRtScreen({Key? key}) : super(key: key);

  final assetsConstant = StrukturRtAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarStrukturRt(),

          130.verticalSpace,

          // Empty
          const EmptyStrukturRt(),
        ],
      ),
    );
  }
}

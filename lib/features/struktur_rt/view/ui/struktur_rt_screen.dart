import 'package:flutter/material.dart';
import 'package:venturo_core/features/struktur_rt/constants/struktur_rt_assets_constant.dart';

class StrukturRtScreen extends StatelessWidget {
  StrukturRtScreen({Key? key}) : super(key: key);

  final assetsConstant = StrukturRtAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffeff0f5),
    );
  }
}

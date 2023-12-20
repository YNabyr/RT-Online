import 'package:flutter/material.dart';
import 'package:venturo_core/features/iuran_warga/constants/iuran_warga_assets_constant.dart';

class IuranWargaScreen extends StatelessWidget {
  IuranWargaScreen({Key? key}) : super(key: key);

  final assetsConstant = IuranWargaAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffeff0f5),
    );
  }
}

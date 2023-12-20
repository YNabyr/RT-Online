import 'package:flutter/material.dart';
import 'package:venturo_core/features/data_warga/constants/data_warga_assets_constant.dart';

class DataWargaScreen extends StatelessWidget {
  DataWargaScreen({Key? key}) : super(key: key);

  final assetsConstant = DataWargaAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xffeff0f5),
    );
  }
}

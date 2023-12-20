import 'package:flutter/material.dart';
import 'package:venturo_core/features/informasi/constants/informasi_assets_constant.dart';

class InformasiScreen extends StatelessWidget {
  InformasiScreen({Key? key}) : super(key: key);

  final assetsConstant = InformasiAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xffeff0f5),
    );
  }
}

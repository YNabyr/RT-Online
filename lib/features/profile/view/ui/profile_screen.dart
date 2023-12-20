import 'package:flutter/material.dart';
import 'package:venturo_core/features/profile/constants/profile_assets_constant.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffeff0f5),
    );
  }
}

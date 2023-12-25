import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/profile/constants/profile_assets_constant.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarProfile(),

          32.verticalSpace,

          // Profile Card
          const ProfileCard(),

          43.verticalSpace,

          // Bar
          bar(
            icon: "assets/images/ic_person_fill.png",
            text: "Edit Profile",
            onTap: () {
              Get.toNamed(Routes.profileEditRoute);
            },
          ),

          15.verticalSpace,

          bar(
            icon: "assets/images/ic_unlock_fill.png",
            text: "Ubah Password",
            onTap: () {
              Get.toNamed(Routes.ubahPasswordRoute);
            },
          ),

          Expanded(child: Container()),

          // Button Logout
          ButtonGradientProfile(
            text: "Logout",
            onPressed: () {},
          ),

          25.verticalSpace,
        ],
      ),
    );
  }

  Widget bar({
    bool showIcon = true,
    bool showText = true,
    required String icon,
    required String text,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: 382.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(4, 3),
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ],
        ),
        child: SizedBox(
          height: 30.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              showIcon
                  ? SizedBox(
                      width: 30.w,
                      child: ImageIcon(
                        AssetImage(icon),
                        color: const Color(0xff6454F0),
                      ),
                    )
                  : const SizedBox(),

              // Text
              showText
                  ? SizedBox(
                      width: 278.w - 32.w,
                      child: Text(
                        text,
                        style: NunitoTextStyle.fw500.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  : const SizedBox(),

              // Button Icon
              SizedBox(
                width: 24.w,
                child: const ImageIcon(
                  AssetImage("assets/images/ic_arrow_ios_right.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

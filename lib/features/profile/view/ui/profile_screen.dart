import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/profile/constants/profile_assets_constant.dart';
import 'package:venturo_core/features/profile/controllers/profile_controller.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xffeff0f5),
        body: (DataBlokController.to.isLoading.value == true)
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  // Topbar
                  const TopBarProfile(),

                  32.verticalSpace,

                  // Profile Card
                  Obx(
                    () => ProfileCard(
                      photo: ProfileController.to.userInfo['photo_url'],
                      badge: ProfileController.to.badge.value,
                      name: ProfileController.to.userInfo['name'],
                      perumahan: ProfileController.to.userInfo['date_of_birth'],
                    ),
                  ),

                  43.verticalSpace,

                  // Bar
                  bar(
                    icon: "assets/fill/person.svg",
                    text: "Edit Profile",
                    onTap: () {
                      Get.toNamed(
                        Routes.profileEditRoute,
                        arguments: ProfileController.to.userInfo,
                      );
                    },
                  ),

                  15.verticalSpace,

                  bar(
                    icon: "assets/fill/unlock.svg",
                    text: "Ubah Password",
                    onTap: () {
                      Get.toNamed(Routes.ubahPasswordRoute);
                    },
                  ),

                  Expanded(child: Container()),

                  // Button Logout
                  ButtonGradientProfile(
                    plainColor: const Color(0xff094282),
                    suffixIcon: "assets/outline/log-out.svg",
                    text: "Logout",
                    onPressed: () {
                      ProfileController.to.logout();
                    },
                  ),

                  25.verticalSpace,
                ],
              ),
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
                      child: SvgPicture.asset(icon),
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
                child: SvgPicture.asset("assets/outline/arrow-ios-right.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

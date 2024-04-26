import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/profile/controllers/profile_controller.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

class UbahPasswordScreen extends StatelessWidget {
  const UbahPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 910.w,
          child: Column(
            children: [
              // Topbar
              const TopBarProfile(
                title: "Profile",
              ),

              32.verticalSpace,

              // Profile Card
              ProfileCard(
                isEdit: true,
                photo: ProfileController.to.userInfo['photo_url'],
                badge: ProfileController.to.badge.value,
                name: ProfileController.to.userInfo['name'],
                perumahan: ProfileController.to.userInfo['date_of_birth'],
              ),

              43.verticalSpace,

              // Textfield Password sekarang
              TextFieldEditProfile(
                isObscure: true,
                label: "Password Sekarang",
                hint: "Password",
                controller: ProfileController.to.controllerPasswordSekarang,
                textInputType: TextInputType.visiblePassword,
              ),

              20.verticalSpace,

              // TextField Password Baru
              TextFieldEditProfile(
                isObscure: true,
                label: "Password Baru",
                controller: ProfileController.to.controllerPasswordBaru,
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
              ),

              20.verticalSpace,

              // TextField Konfirmasi Password Baru
              TextFieldEditProfile(
                isObscure: true,
                controller:
                    ProfileController.to.controllerKonfirmasiPasswordBaru,
                label: "Konfirmasi Password Baru",
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
              ),

              Expanded(child: Container()),

              // Button simpan
              ButtonGradientProfile(
                text: "Simpan",
                onPressed: () {},
              ),

              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

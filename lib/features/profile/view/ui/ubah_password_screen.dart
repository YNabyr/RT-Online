import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/profile/view/components/button_gradient_profile.dart';
import 'package:venturo_core/features/profile/view/components/profile_card.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';
import 'package:venturo_core/features/profile/view/components/top_bar_profile.dart';

class UbahPasswordScreen extends StatelessWidget {
  const UbahPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const ProfileCard(
                isEdit: true,
              ),

              43.verticalSpace,

              // Textfield Password sekarang
              const TextFieldEditProfile(
                isObscure: true,
                label: "Password Sekarang",
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
                icon: "assets/images/ic_eye_on.png",
              ),

              20.verticalSpace,

              // TextField Password Baru
              const TextFieldEditProfile(
                isObscure: true,
                label: "Password Baru",
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
                icon: "assets/images/ic_eye_on.png",
              ),

              20.verticalSpace,

              // TextField Konfirmasi Password Baru
              const TextFieldEditProfile(
                isObscure: true,
                label: "Konfirmasi Password Baru",
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
                icon: "assets/images/ic_eye_on.png",
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/lupa_password_title.dart';
import 'package:venturo_core/features/auth/view/components/textfield_auth.dart';

class PasswordBaruScreen extends StatelessWidget {
  const PasswordBaruScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Header
          const HeaderAuth(),

          35.verticalSpace,

          const LupaPasswordTitle(title: "Masukkan Password Baru"),

          5.verticalSpace,

          // TextField New Password
          const TextFieldAuth(
            label: "Password Baru",
            hint: "Masukkan Password",
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: "assets/images/ic_eye_off.png",
          ),

          15.verticalSpace,

          // TextField Confirm New Password
          const TextFieldAuth(
            label: "Konfirmasi Password Baru",
            hint: "Masukkan Password",
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: "assets/images/ic_eye_off.png",
          ),

          29.verticalSpace,

          // Button Simpan
          ButtonGradientAuth(
            text: "Simpan",
            onPressed: () {},
          ),

          Expanded(child: Container()),

          // Footer
          const FooterAuth(),

          32.verticalSpace,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/textfield_auth.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Header
          const HeaderAuth(),

          35.verticalSpace,

          // TextField
          const TextFieldAuth(
            label: "No. Handphone",
            hint: "Masukkan no. handphone",
            keyboardType: TextInputType.phone,
          ),

          15.verticalSpace,

          // TextField Password
          const TextFieldAuth(
            label: "Password",
            hint: "Masukkan Password",
            keyboardType: TextInputType.visiblePassword,
            isObscure: true,
            suffixIcon: "assets/images/ic_eye_off.png",
          ),

          8.verticalSpace,

          // Lupa password
          Container(
            padding: EdgeInsets.only(right: 4.w),
            width: 382.w,
            child: GestureDetector(
              onTap: () {
                AuthController.to.toLupaPassword();
              },
              child: Text(
                'Lupa Password ?',
                textAlign: TextAlign.end,
                style: NunitoTextStyle.fw800.copyWith(
                  color: const Color(0xFF6454F0),
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),

          32.verticalSpace,

          // Button
          ButtonGradientAuth(
            text: "Login",
            onPressed: () {
              // pindah Page
              AuthController.to.toInvitation();
            },
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

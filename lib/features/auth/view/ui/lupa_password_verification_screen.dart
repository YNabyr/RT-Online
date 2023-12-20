import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/lupa_password_title.dart';

class LupaPasswordVerificationScreen extends StatelessWidget {
  const LupaPasswordVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          const HeaderAuth(),

          35.verticalSpace,

          // Forgot Password Title
          const LupaPasswordTitle(
            title: "Lupa Password",
            text: "Masukkan 4 kode yang sudah dikirim ke Emailmu",
          ),

          10.verticalSpace,

          // pin input
          Pinput(
            length: 4,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value != "1234") {
                return "Kode OTP salah";
              }

              return AuthController.to.toPasswordBaru();
            },
          ),

          25.verticalSpace,

          // Button Verifikasi
          ButtonGradientAuth(text: "Verifikasi", onPressed: () {}),

          15.verticalSpace,

          // Text
          const Text("Kirim ulang kode verifikasi dalam 00:57"),

          // Expanded agar FooterRtOnline() berada di bagian bawah
          Expanded(
            child: Container(),
          ),

          // Footer
          const FooterAuth(),

          32.verticalSpace,
        ],
      ),
    );
  }
}

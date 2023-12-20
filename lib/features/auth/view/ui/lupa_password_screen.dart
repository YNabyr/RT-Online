import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/lupa_password_title.dart';
import 'package:venturo_core/features/auth/view/components/textfield_auth.dart';

class LupaPasswordScreen extends StatelessWidget {
  const LupaPasswordScreen({Key? key}) : super(key: key);

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

          // Forgot Password Title
          const LupaPasswordTitle(
            title: "Lupa Password",
            text:
                'Masukan Email kamu untuk proses verifikasi, kami akan mengirimkan 4 digit kode ke email kamu.',
          ),

          25.verticalSpace,

          // TextField No. Hp
          const TextFieldAuth(
            label: "No. Handphone",
            hint: "Masukkan No. Handphone",
            keyboardType: TextInputType.number,
          ),

          25.verticalSpace,

          // Button Kirim Kode Verifikasi
          ButtonGradientAuth(
            text: "Kirim Kode Verifikasi",
            onPressed: () {
              AuthController.to.toLupaPasswordVerification();
            },
          ),

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

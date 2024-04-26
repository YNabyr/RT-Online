import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/textfield_auth.dart';
import 'package:venturo_core/features/profile/view/components/text_field_edit_profile.dart';

import '../../../../shared/styles/google_text_style.dart';
import '../../controllers/auth_controller.dart';
import '../components/button_gradient_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(239, 240, 245, 1),
      body: Column(
        children: [
          // Header
          const HeaderAuth(),

          35.verticalSpace,

          // TextField
          TextFieldAuth(
            label: "No. Handphone",
            hint: "Masukkan no. handphone",
            keyboardType: TextInputType.text,
            controller: AuthController.to.emailInput,
          ),

          15.verticalSpace,

          // Textfield Password
          Obx(
            () => TextFieldAuth(
              label: "Password",
              hint: "Masukkan Password",
              onTapSuffixIcon: () {
                setState(() {
                  controller.changeIcon();
                });
              },
              keyboardType: TextInputType.visiblePassword,
              isObscure: controller.isObscure.value,
              suffixIcon: controller.suffixIcon.value,
              controller: AuthController.to.passwordInput,
            ),
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
            onPressed: () async {
              // Panggil fungsi fetchUserData()
              await AuthController.to.loginUser(
                phoneNumber: AuthController.to.emailInput.text,
                password: AuthController.to.passwordInput.text,
              );
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

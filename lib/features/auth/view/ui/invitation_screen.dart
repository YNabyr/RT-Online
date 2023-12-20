import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/auth/view/components/button_gradient_auth.dart';
import 'package:venturo_core/features/auth/view/components/footer_auth.dart';
import 'package:venturo_core/features/auth/view/components/header_auth.dart';
import 'package:venturo_core/features/auth/view/components/profile_auth.dart';
import 'package:venturo_core/features/auth/view/components/textfield_auth.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Header
            const HeaderAuth(),

            35.verticalSpace,

            // Card Profile
            const ProfileAuth(),

            25.verticalSpace,

            // TextField Nama
            TextFieldAuth(
              label: "Nama",
              hint: "Krisna Maulana",
              controller: TextEditingController(text: "Krisna Maulana"),
              keyboardType: TextInputType.name,
              isReadOnly: true,
            ),

            15.verticalSpace,

            // TextField No. Hp
            TextFieldAuth(
              label: "No. Handphone",
              hint: "Krisna Maulana",
              controller: TextEditingController(text: "08123456789"),
              keyboardType: TextInputType.name,
              isReadOnly: true,
            ),

            15.verticalSpace,

            // TextField Nama
            const TextFieldAuth(
              isObscure: true,
              label: "Password",
              hint: "Masukkan Password",
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: "assets/images/ic_eye_off.png",
            ),

            45.verticalSpace,

            // Button Join
            ButtonGradientAuth(
              text: "Join",
              onPressed: () {
                AuthController.to.toDashboard();
              },
            ),

            35.verticalSpace,

            // Footer
            const FooterAuth(),

            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}

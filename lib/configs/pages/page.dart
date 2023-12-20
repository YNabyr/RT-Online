import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/auth/bindings/auth_binding.dart';
import 'package:venturo_core/features/auth/view/ui/invitation_screen.dart';
import 'package:venturo_core/features/auth/view/ui/login_screen.dart';
import 'package:venturo_core/features/auth/view/ui/lupa_password_screen.dart';
import 'package:venturo_core/features/auth/view/ui/lupa_password_verification_screen.dart';
import 'package:venturo_core/features/auth/view/ui/password_baru_screen.dart';
import 'package:venturo_core/features/dashboard/bindings/dashboard_binding.dart';
import 'package:venturo_core/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),

    // Login
    GetPage(
        name: Routes.loginRoute,
        page: () => const LoginScreen(),
        binding: AuthBinding()),

    // Invitation
    GetPage(
        name: Routes.invitationRoute,
        page: () => const InvitationScreen(),
        binding: AuthBinding()),

    // Lupa Password
    GetPage(
        name: Routes.lupaPasswordRoute,
        page: () => const LupaPasswordScreen(),
        binding: AuthBinding()),

    // Lupa password verif
    GetPage(
        name: Routes.lupaPasswordVerificationRoute,
        page: () => const LupaPasswordVerificationScreen(),
        binding: AuthBinding()),

    // password baru
    GetPage(
        name: Routes.passwordBaruRoute,
        page: () => const PasswordBaruScreen(),
        binding: AuthBinding()),

    // password baru
    GetPage(
        name: Routes.dashboardRoute,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
  ];
}

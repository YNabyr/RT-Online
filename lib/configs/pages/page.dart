import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/auth/bindings/auth_binding.dart';
import 'package:venturo_core/features/auth/view/ui/invitation_screen.dart';
import 'package:venturo_core/features/auth/view/ui/login_screen.dart';
import 'package:venturo_core/features/auth/view/ui/lupa_password_screen.dart';
import 'package:venturo_core/features/auth/view/ui/lupa_password_verification_screen.dart';
import 'package:venturo_core/features/auth/view/ui/password_baru_screen.dart';
import 'package:venturo_core/features/beranda/bindings/beranda_binding.dart';
import 'package:venturo_core/features/beranda/view/ui/beranda_screen.dart';
import 'package:venturo_core/features/beranda/view/ui/preview_saldo_kas_screen.dart';
import 'package:venturo_core/features/dashboard/bindings/dashboard_binding.dart';
import 'package:venturo_core/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:venturo_core/features/data_warga/bindings/data_warga_binding.dart';
import 'package:venturo_core/features/data_warga/view/ui/data_warga_empty_screen.dart';
import 'package:venturo_core/features/data_warga/view/ui/data_warga_screen.dart';
import 'package:venturo_core/features/pengumuman_banner/bindings/detail_banner_binding.dart';
import 'package:venturo_core/features/pengumuman_banner/view/ui/detail_banner_screen.dart';
import 'package:venturo_core/features/profile/bindings/profile_binding.dart';
import 'package:venturo_core/features/profile/view/ui/edit_profile_screen.dart';
import 'package:venturo_core/features/profile/view/ui/profile_screen.dart';
import 'package:venturo_core/features/profile/view/ui/ubah_password_screen.dart';
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

    // dashboard
    GetPage(
        name: Routes.dashboardRoute,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),

    // beranda
    GetPage(
        name: Routes.berandaRoute,
        page: () => BerandaScreen(),
        binding: BerandaBinding()),

    // Preview saldo kas
    GetPage(
        name: Routes.previewSaldoKas,
        page: () => const PreviewSaldoKasScreen(),
        binding: BerandaBinding()),

    // data Warga
    GetPage(
        name: Routes.dataWargaRoute,
        page: () => DataWargaScreen(),
        binding: DataWargaBinding()),

    // data Warga Empty
    GetPage(
        name: Routes.dataWargaEmptyRoute,
        page: () => const DataWargaEmptyScreen(),
        binding: DataWargaBinding()),

    // Profile
    GetPage(
        name: Routes.profileRoute,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),

    // Profile Edit
    GetPage(
        name: Routes.profileEditRoute,
        page: () => const EditProfileScreen(),
        binding: ProfileBinding()),

    // Ubah Password
    GetPage(
        name: Routes.ubahPasswordRoute,
        page: () => const UbahPasswordScreen(),
        binding: ProfileBinding()),

// Banner
    GetPage(
      name: Routes.detailBannerRoute,
      page: () => const DetailBannerScreen(),
      binding: DetailBannerBinding(),
    ),
  ];
}

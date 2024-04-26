import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_dashboard/bindings/admin_dashboard_binding.dart';
import 'package:venturo_core/features/admin_dashboard/view/ui/admin_dashboard_screen.dart';
import 'package:venturo_core/features/admin_general/bindings/admin_general_binding.dart';
import 'package:venturo_core/features/admin_general/view/ui/admin_edit_general_screen.dart';
import 'package:venturo_core/features/admin_general/view/ui/admin_general_screen.dart';
import 'package:venturo_core/features/admin_hak_akses/bindings/admin_hak_akses_binding.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_edit_hak_akses_screen.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_hak_akses_screen.dart';
import 'package:venturo_core/features/admin_hak_akses/view/ui/admin_tambah_hak_akses_screen.dart';
import 'package:venturo_core/features/admin_informasi/bindings/admin_informasi_binding.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_edit_informasi.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_informasi_screen.dart';
import 'package:venturo_core/features/admin_informasi/view/ui/admin_tambah_informasi_screen.dart';
import 'package:venturo_core/features/admin_iuran/bindings/admin_iuran_binding.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_edit_iuran_screen.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_tambah_iuran_screen.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_iuran_screen.dart';
import 'package:venturo_core/features/admin_iuran/view/ui/admin_kategori_iuran_screen.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/bindings/admin_konfirmasi_pembayaran_binding.dart';
import 'package:venturo_core/features/admin_konfirmasi_pembayaran/view/ui/admin_konfirmasi_pembayaran_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/bindings/admin_pengumuman_binding.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_edit_pengumuman.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_pengumuman_screen.dart';
import 'package:venturo_core/features/admin_pengumuman/view/ui/admin_tambah_pengumuman_screen.dart';
import 'package:venturo_core/features/admin_uang_keluar/bindings/admin_uang_keluar_binding.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_detail_pengeluaran_screen.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_tambah_uang_keluar.screen.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_uang_keluar_screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/bindings/admin_uang_masuk_binding.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_detail_pemasukan_screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_tambah_uang_masuk_screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/ui/admin_uang_masuk_screen.dart';
import 'package:venturo_core/features/admin_undang_warga/bindings/admin_undang_warga_binding.dart';
import 'package:venturo_core/features/admin_undang_warga/view/ui/admin_undang_warga_screen.dart';
import 'package:venturo_core/features/auth/bindings/auth_binding.dart';
import 'package:venturo_core/features/auth/bindings/invitation_binding.dart';
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
import 'package:venturo_core/features/data_blok/bindings/data_blok_binding.dart';
import 'package:venturo_core/features/data_blok/view/ui/admin_tambah_data_rumah_screen.dart';
import 'package:venturo_core/features/data_blok/view/ui/coba_api.dart';
import 'package:venturo_core/features/data_blok/view/ui/data_blok_screen.dart';
import 'package:venturo_core/features/data_warga/bindings/data_warga_binding.dart';
import 'package:venturo_core/features/data_warga/view/ui/data_warga_empty_screen.dart';
import 'package:venturo_core/features/data_warga/view/ui/data_warga_screen.dart';
import 'package:venturo_core/features/informasi/bindings/informasi_binding.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_list_screen.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_screen.dart';
import 'package:venturo_core/features/iuran_warga/bindings/iuran_warga_binding.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/iuran_warga_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/rekap_bulanan_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/rekap_tahunan_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/riwayat_pembayaran_screen.dart';
import 'package:venturo_core/features/iuran_warga/view/ui/struk_pembayaran_screen.dart';
import 'package:venturo_core/features/laporan_keuangan/bindings/laporan_keuangan_binding.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/detail_pemasukan_screen.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/detail_pengeluaran_screen.dart';
import 'package:venturo_core/features/laporan_keuangan/view/ui/laporan_keuangan_screen.dart';
import 'package:venturo_core/features/pembayaran/bindings/pembayaran_binding.dart';
import 'package:venturo_core/features/pembayaran/view/ui/pembayaran_screen.dart';
import 'package:venturo_core/features/pembayaran/view/ui/rincian_iuran_screen.dart';
import 'package:venturo_core/features/pengumuman_banner/bindings/detail_banner_binding.dart';
import 'package:venturo_core/features/pengumuman_banner/bindings/pengumuman_banner_binding.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_pengumuman_card.dart';
import 'package:venturo_core/features/pengumuman_banner/view/ui/detail_banner_screen.dart';
import 'package:venturo_core/features/pengumuman_banner/view/ui/detail_pengumuman_screen.dart';
import 'package:venturo_core/features/profile/bindings/profile_binding.dart';
import 'package:venturo_core/features/profile/view/ui/edit_profile_screen.dart';
import 'package:venturo_core/features/profile/view/ui/profile_screen.dart';
import 'package:venturo_core/features/profile/view/ui/ubah_password_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';
import 'package:venturo_core/main.dart';

abstract class Pages {
  static final pages = [
    ///
    /// ADMIN
    ///

    // ADMIN DASHBOARD
    GetPage(
      name: Routes.adminDashboardRoute,
      page: () => const AdminDashboardScreen(),
      binding: AdminDashboardBinding(),
    ),

    // ADMIN GENERAL
    GetPage(
      name: Routes.adminGeneralRoute,
      page: () => AdminGeneralScreen(),
      binding: AdminGeneralBinding(),
    ),
    GetPage(
      name: Routes.adminEditGeneralRoute,
      page: () => AdminEditGeneralScreen(),
      binding: AdminGeneralBinding(),
    ),

    // ADMIN PENGUMUMAN
    GetPage(
      name: Routes.adminPengumumanRoute,
      page: () => AdminPengumumanScreen(),
      binding: AdminPengumumanBinding(),
    ),
    GetPage(
      name: Routes.adminTambahPengumumanRoute,
      page: () => AdminTambahPengumumanScreen(),
      binding: AdminPengumumanBinding(),
    ),
    GetPage(
      name: Routes.adminEditPengumumanRoute,
      page: () => AdminEditPengumumanScreen(),
      binding: AdminPengumumanBinding(),
    ),

    // ADMIN INFORMASI
    GetPage(
      name: Routes.adminInformasiRoute,
      page: () => AdminInformasiScreen(),
      binding: AdminInformasiBinding(),
    ),
    GetPage(
      name: Routes.adminTambahInformasiRoute,
      page: () => AdminTambahInformasiScreen(),
      binding: AdminInformasiBinding(),
    ),
    GetPage(
      name: Routes.adminEditInformasiRoute,
      page: () => AdminEditInformasiScreen(),
      binding: AdminInformasiBinding(),
    ),

    // ADMIN IURAN WARGA
    GetPage(
      name: Routes.adminIuranRoute,
      page: () => AdminIuranScreen(),
      binding: AdminIuranBinding(),
    ),
    GetPage(
      name: Routes.adminTambahIuranRoute,
      page: () => const AdminTambahIuranScreen(),
      binding: AdminIuranBinding(),
    ),
    GetPage(
      name: Routes.adminEditIuranRoute,
      page: () => const AdminEditIuranScreen(),
      binding: AdminIuranBinding(),
    ),
    GetPage(
      name: Routes.adminKategoriIuranRoute,
      page: () => AdminKategoriIuranScreen(),
      binding: AdminIuranBinding(),
    ),

    // ADMIN HAK AKSES
    GetPage(
      name: Routes.adminHakAksesRoute,
      page: () => AdminHakAksesScreen(),
      binding: AdminHakAksesBinding(),
    ),
    GetPage(
      name: Routes.adminTambahHakAksesRoute,
      page: () => const AdminTambahHakAksesScreen(),
      binding: AdminHakAksesBinding(),
    ),
    GetPage(
      name: Routes.adminEditHakAksesRoute,
      page: () => AdminEditHakAksesScreen(),
      binding: AdminHakAksesBinding(),
    ),

    // ADMIN UNDANG WARGA
    GetPage(
      name: Routes.adminUndangWarga,
      page: () => AdminUndangWargaScreen(),
      binding: AdminUndangWargaBinding(),
    ),

    // ADMIN BLOK DAN NO RUMAH
    GetPage(
      name: Routes.adminDataBlok,
      page: () => DataBlokScreen(),
      binding: DataBlokBinding(),
    ),
    GetPage(
      name: Routes.adminTambahDataRumahRoute,
      page: () => const AdminTambahDataRumahScreen(),
      binding: DataBlokBinding(),
    ),

    // ADMIN KONFIRMASI PEMBAYARAN
    GetPage(
      name: Routes.adminKonfirmasiPembayaranRoute,
      page: () => AdminKonfirmasiPembayaranScreen(),
      binding: AdminKonfirmasiPembayaranBinding(),
    ),

    // ADMIN UANG MASUK
    GetPage(
      name: Routes.adminTambahUangMasukRoute,
      page: () => AdminTambahUangMasukScreen(),
      binding: AdminUangMasukBinding(),
    ),
    GetPage(
      name: Routes.adminDetailPemasukanRoute,
      page: () => const AdminDetailPemasukanScreen(),
      binding: AdminUangMasukBinding(),
    ),
    GetPage(
      name: Routes.adminUangMasukRoute,
      page: () => AdminUangMasukScreen(),
      binding: AdminUangMasukBinding(),
    ),

    // ADMIN UANG KELUAR
    GetPage(
      name: Routes.adminUangKeluarRoute,
      page: () => AdminUangKeluarScreen(),
      binding: AdminUangKeluarBinding(),
    ),
    GetPage(
      name: Routes.adminTambahUangKeluarRoute,
      page: () => const AdminTambahUangKeluarScreen(),
      binding: AdminUangKeluarBinding(),
    ),
    GetPage(
      name: Routes.adminDetailPengeluaranRoute,
      page: () => const AdminDetailPengeluaranScreen(),
      binding: AdminUangKeluarBinding(),
    ),

    ///
    /// WARGA
    ///

    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),

    GetPage(
      name: Routes.cobaApi,
      page: () => const CobaApi(),
    ),

    // Custom Test
    GetPage(
      name: Routes.customTestRoute,
      page: () => const CustomTest(),
    ),

    // Login
    GetPage(
        name: Routes.loginRoute,
        page: () => const LoginScreen(),
        binding: AuthBinding()),

    // Warga
    GetPage(
      name: Routes.rincianIuranRoute,
      page: () => const RincianIuranScreen(),
      binding: PembayaranBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.detailPemasukanRoute,
      page: () => DetailPemasukanScreen(),
      binding: LaporanKeuanganBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.detailPengeluaranRoute,
      page: () => DetailPengeluaranScreen(),
      binding: LaporanKeuanganBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.tataTertibRoute,
      page: () => const TataTertibScreen(),
      binding: InformasiBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.tataTertibListRoute,
      page: () => TataTertibListScreen(),
      binding: InformasiBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.pembayaranRoute,
      page: () => PembayaranScreen(),
      binding: PembayaranBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.riwayatPembayaranRoute,
      page: () => const RiwayatPembayaranScreen(),
      binding: IuranWargaBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.rekapTahunanRoute,
      page: () => RekapTahunanScreen(),
      binding: IuranWargaBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.rekapBulananRoute,
      page: () => RekapBulananScreen(),
      binding: IuranWargaBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.strukPembayaranRoute,
      page: () => const StrukPembayaranScreen(),
      binding: IuranWargaBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.iuranWargaRoute,
      page: () => IuranWargaScreen(),
      binding: IuranWargaBinding(),
    ),

    // Warga
    GetPage(
      name: Routes.laporanKeuanganRoute,
      page: () => LaporanKeuanganScreen(),
      binding: LaporanKeuanganBinding(),
    ),

    // Invitation
    GetPage(
        name: Routes.invitationRoute,
        page: () => const InvitationScreen(),
        binding: InvitationBinding()),

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
      binding: ProfileBinding(),
    ),

    // Profile Edit
    GetPage(
        name: Routes.profileEditRoute,
        page: () => EditProfileScreen(),
        binding: ProfileBinding()),

    // Ubah Password
    GetPage(
        name: Routes.ubahPasswordRoute,
        page: () => const UbahPasswordScreen(),
        binding: ProfileBinding()),

    // Banner Detail
    GetPage(
      name: Routes.detailBannerRoute,
      page: () => const DetailBannerScreen(),
      binding: DetailBannerBinding(),
    ),

    // Pengumuman Detail
    GetPage(
      name: Routes.detailPengumumanRoute,
      page: () => const DetailPengumumanScreen(),
      binding: AdminDashboardBinding(),
    ),
  ];
}

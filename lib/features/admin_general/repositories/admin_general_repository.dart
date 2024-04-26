// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:venturo_core/features/admin_general/constants/admin_general_api_constant.dart';

class AdminGeneralRepository {
  AdminGeneralRepository._();

  var apiConstant = AdminGeneralApiConstant();
}

List<General> listGeneral = [
  General(
    perumahan: "Perumahan Griya Shanta",
    noRT: 1,
    noRW: 1,
    alamat: "JL. Sukarno Hatta",
    provinsi: "Jawa Timur",
    kota: "Kota Malang",
    kecamatan: "Lowokwaru",
    kokdePos: 65111,
    penanggungJawab: "Jojo",
    noTelp: 08123456789,
    strukturRT: [
      StrukturRT(nama: "Joko", jabatan: "Ketua RT"),
      StrukturRT(nama: "Dara", jabatan: "Bendahara"),
    ],
    namaBank: "Bank BCA",
    noRek: 6126789,
    namaPemilikRek: "Dara",
  ),
];

class General {
  General({
    required this.perumahan,
    required this.noRT,
    required this.noRW,
    required this.alamat,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kokdePos,
    required this.penanggungJawab,
    required this.noTelp,
    required this.strukturRT,
    required this.namaBank,
    required this.noRek,
    required this.namaPemilikRek,
  });

  String perumahan;
  final int noRT;
  final int noRW;
  final String alamat;
  final String provinsi;
  final String kota;
  final String kecamatan;
  final int kokdePos;
  final String penanggungJawab;
  final int noTelp;

  // Struktur RT
  List<StrukturRT> strukturRT;

  // Akun Bank
  final String namaBank;
  final int noRek;
  final String namaPemilikRek;
}

class StrukturRT {
  final String nama;
  final String jabatan;
  StrukturRT({
    required this.nama,
    required this.jabatan,
  });
}

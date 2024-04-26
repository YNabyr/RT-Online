import 'package:venturo_core/features/pembayaran/constants/pembayaran_api_constant.dart';

class PembayaranRepository {
  // PembayaranRepository._();
  PembayaranRepository();

  var apiConstant = PembayaranApiConstant();

  List<Map<String, dynamic>> listPembayaran = [
    {
      "bulan": 'Juli',
      "nominal": 300000,
      "terbayar": true,
    },
    {
      "bulan": 'Juli',
      "nominal": 300000,
      "terbayar": true,
    },
    {
      "bulan": 'Juli',
      "nominal": 3500000,
      "terbayar": false,
    },
    {
      "bulan": 'Juni',
      "nominal": 300000,
      "terbayar": true,
    },
    {
      "bulan": 'Februari',
      "nominal": 300000,
      "terbayar": false,
    },
    {
      "bulan": 'Oktober',
      "nominal": 300000,
      "terbayar": false,
    },
    {
      "bulan": 'Agustus',
      "nominal": 300000,
      "terbayar": false,
    },
    {
      "bulan": 'November',
      "nominal": 300000,
      "terbayar": false,
    },
    {
      "bulan": 'Desember',
      "nominal": 300000,
      "terbayar": false,
    },
  ];

  List<Map<String, dynamic>> getListPembayaran() {
    return listPembayaran;
  }
}

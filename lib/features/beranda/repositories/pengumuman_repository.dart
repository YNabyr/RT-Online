import 'package:get/get.dart';

class PengumumanRepository extends GetxController {
  // Data Pengumuman Content
  List<Map<String, String>> getPengumumanList() {
    return [
      {
        'title': 'Berita Duka',
        'date': '10 Okt 2023',
        'content':
            'Di beritahukan kepada warga komplek Griya Shanta. Telah Meninggal dunia saudara kita yang bernama Ahmadi Ahmad, Pukul 13:00',
      },
      {
        'title': 'Pengumuman Biasa',
        'date': '11 Okt 2023',
        'content':
            'Ini adalah pengumuman biasa tanpa pin. Isinya bisa berupa informasi penting untuk warga komplek.',
      },
      {
        'title': 'Pengumuman Lainnya',
        'date': '12 Okt 2023',
        'content':
            'Ini adalah pengumuman lainnya dengan konten yang berbeda. Diharapkan warga untuk memperhatikan informasi ini.',
      },
      {
        'title': 'Pengumuman Terakhir',
        'date': '13 Okt 2023',
        'content':
            'Ini adalah pengumuman terakhir dalam daftar. Pastikan untuk membacanya dan memahami informasi yang disampaikan.',
      },
      // Tambahkan pengumuman lainnya sesuai kebutuhan
    ];
  }
}

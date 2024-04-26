import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';

class AdminTambahKategoriInformasiController extends GetxController {
  static AdminTambahKategoriInformasiController get to => Get.find();

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/categories";

  // isLoading
  var isLoading = false.obs;

  // List Kategori Informasi
  RxList<Map<String, dynamic>> listNameKategoriInformasi =
      <Map<String, dynamic>>[].obs;

  // POST
  Future<void> postKategoriInformasi(int index) async {
    print(listNameKategoriInformasi);
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = listNameKategoriInformasi;

      // Buat objek request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(apiUrl),
      );

      postData[index].forEach((key, value) {
        request.fields[key] = value;
      });

      // Kirim request dan dapatkan response
      var response = await request.send();

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Kategori Informasi berhasil ditambahkan
        print('Kategori Informasi berhasil ditambahkan');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Kategori Informasi berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Kategori Informasi
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah Kategori Informasi',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Kategori Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // DELETE Kategori Informasi
  Future<void> deleteKategoriInformasi(
    String kategoriInformasiId, {
    Function()? onRemove,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse(
            "https://rtonline-api.venturo.pro/api/v1/categories/$kategoriInformasiId"),
      );

      if (response.statusCode == 200) {
        onRemove;
        // Informasi dihapus dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Informasi berhasil dihapus');
        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Kategori Informasi Berhasil Dihapus',
          snackPosition: SnackPosition.TOP,
        );

        // Kemudian, perbarui data Informasi
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menghapus Kategori Informasi',
          snackPosition: SnackPosition.TOP,
        );

        throw Exception('Gagal menghapus Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // EDIT Kategori Informasi
  Future<void> editKategoriInformasi(
      String kategoriInformasiId, String newName) async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var putData = {
        "id": kategoriInformasiId,
        "name": newName,
      };

      // Buat objek request
      var response = await http.put(
        Uri.parse(apiUrl),
        body: putData,
      );

      print(response.statusCode);
      print(kategoriInformasiId);
      print(newName);

      if (response.statusCode == 200) {
        // Kategori Informasi berhasil diubah
        print('Kategori Informasi berhasil diubah');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Kategori Informasi berhasil diubah',
          snackPosition: SnackPosition.TOP,
        );

        // Kemudian, perbarui data Kategori Informasi
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Mengubah Kategori Informasi',
          snackPosition: SnackPosition.TOP,
        );

        throw Exception('Gagal mengubah Kategori Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

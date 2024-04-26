import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

class AdminTambahBlok extends GetxController {
  static AdminTambahBlok get to => Get.find();
  var dataBlokController = Get.put(DataBlokController());

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/blocks";

  // isLoading
  var isLoading = false.obs;

  var selectedId = "".obs;

  // List Blok
  RxList<Map<String, dynamic>> listBlokName = <Map<String, dynamic>>[].obs;

  get selectId {
    return selectedId.value = dataBlokController.listBlok
        .where(
          (element) =>
              element['name'] == dataBlokController.selectedItems.value,
        )
        .map((e) => e['id'])
        .elementAt(0)
        .toString();
  }

  // no rumah
  var rumahController = TextEditingController();

  Future<void> postHouse() async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = {
        "block_id": selectedId.value,
        "house_number": rumahController.text
      };

      // // Ubah postData menjadi JSON
      // String jsonData = jsonEncode(postData);

      print(postData);

      // Buat objek request
      var response = await http.post(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/houses"),
        body: postData,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        // House berhasil ditambahkan
        print('House berhasil ditambahkan');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'House berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data House
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah House',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan House');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // POST
  Future<void> postBlok(int index) async {
    print(listBlokName);
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = listBlokName;

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
        // Blok berhasil ditambahkan
        print('Blok berhasil ditambahkan');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Blok berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Blok
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah Blok',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Blok');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // DELETE Blok
  Future<void> deleteBlok(
    String blokId, {
    Function()? onRemove,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/blocks/$blokId"),
      );

      if (response.statusCode == 200) {
        onRemove;
        // Informasi dihapus dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Informasi berhasil dihapus');
        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Blok Berhasil Dihapus',
          snackPosition: SnackPosition.TOP,
        );

        // Kemudian, perbarui data Informasi
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menghapus Blok',
          snackPosition: SnackPosition.TOP,
        );

        throw Exception('Gagal menghapus Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // EDIT Blok
  Future<void> editBlok(String blokId, String newName) async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var putData = {
        "id": blokId,
        "name": newName,
      };

      // Buat objek request
      var response = await http.put(
        Uri.parse(apiUrl),
        body: putData,
      );

      print(response.statusCode);
      print(blokId);
      print(newName);

      if (response.statusCode == 200) {
        // Blok berhasil diubah
        print('Blok berhasil diubah');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Blok berhasil diubah',
          snackPosition: SnackPosition.TOP,
        );

        // Kemudian, perbarui data Blok
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Mengubah Blok',
          snackPosition: SnackPosition.TOP,
        );

        throw Exception('Gagal mengubah Blok');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

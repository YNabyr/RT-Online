import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';

class AdminEditInformasiController extends GetxController {
  static AdminEditInformasiController get to => Get.find();

  // Deskripsi
  var controllerDeskripsi = TextEditingController().obs;
  var description = "".obs;

  // Image
  File? imageInformasi;
  var imagePicker = ImagePicker();
  var pickedImageString = ''.obs;

  // Pick Image
  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);

    // Membaca file gambar sebagai bytes
    if (pickedImage != null) {
      imageInformasi = File(pickedImage.path);
      pickedImageString.value = imageInformasi!.path;

      List<int> imageBytes = [];
      // Membaca file gambar sebagai bytes
      imageBytes = await File(pickedImageString.toString()).readAsBytes();

      // Mengonversi bytes gambar menjadi format base64
      pickedImageString.value = base64Encode(imageBytes);

      print("IMAGE :");
      print(pickedImageString);
    }
  }

  // Edit Informasi
  Future<void> editInformasi(String informasiId) async {
    print("EDIT: ");
    print(informasiId);
    print(controllerDeskripsi.value.text);
    print(AdminTambahInformasiController.to.selectedCategoriesId.value);

    try {
      // Persiapkan data untuk dikirimkan ke server
      Map<String, String> putData = {
        "id": informasiId,
        "description": controllerDeskripsi.value.text,
        "categories_id":
            AdminTambahInformasiController.to.selectedCategoriesId.value,
        "photo": pickedImageString.toString(),
      };

      if (putData['photo'] == null ||
          putData['photo'] == pickedImageString.toString()) {
        putData = {
          "id": informasiId,
          "description": controllerDeskripsi.value.text,
          "categories_id":
              AdminTambahInformasiController.to.selectedCategoriesId.value,
        };
      } else {
        putData = {
          "id": informasiId,
          "description": controllerDeskripsi.value.text,
          "categories_id":
              AdminTambahInformasiController.to.selectedCategoriesId.value,
          "photo": pickedImageString.toString(),
        };
      }

      // Buat objek multipart request untuk mengirim gambar (jika ada)
      var response = await http.put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/information"),
        body: putData,
      );

      if (response.statusCode == 200) {
        // Informasi berhasil diubah, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Informasi berhasil diubah');

        Get.snackbar(
          'Success',
          'Informasi berhasil diubah',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Mengubah Informasi',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal mengubah Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

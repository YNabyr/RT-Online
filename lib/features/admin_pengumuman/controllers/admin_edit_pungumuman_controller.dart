import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AdminEditPengumumanController extends GetxController {
  static AdminEditPengumumanController get to => Get.find();

  // is Loading
  final isLoading = false.obs;

  // Deskripsi
  var controllerTitle = TextEditingController().obs;
  var title = "".obs;

  // Deskripsi
  var controllerDeskripsi = TextEditingController().obs;
  var description = "".obs;

  // Image
  File? imageInformasi;
  var imagePicker = ImagePicker();
  var pickedImageString = ''.obs;

  // Edit Pengumuman
  Future<void> editPengumuman(String pengumumanId, int isPinned) async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      Map<String, dynamic> putData = {
        "id": pengumumanId,
        'title': controllerTitle.value.text,
        'description': controllerDeskripsi.value.text,
        "is_pinned": isPinned.toString(),
        "photo": pickedImageString.toString(),
      };

      // Kirim request
      var response = await http.put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"),
        body: putData,
      );

      if (response.statusCode == 200) {
        // Pengumuman berhasil diubah, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Pengumuman berhasil diubah');

        Get.snackbar(
          'Success',
          'Pengumuman berhasil diubah',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Mengubah Pengumuman',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal mengubah pengumuman');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AdminTambahPengumumanController extends GetxController {
  static AdminTambahPengumumanController get to => Get.find();

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/categories";

  // is Loading
  var isLoading = false.obs;

  // Judul
  var controllerTitle = TextEditingController().obs;
  var title = "".obs;

  // Deskripsi
  var controllerDeskripsi = TextEditingController().obs;
  var description = "".obs;

  // Image
  File? image;
  var imagePicker = ImagePicker();
  var pickedImageString = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      image = File(pickedImage.path);

      // Menampilkan string path gambar ketika berhasil dipilih
      pickedImageString.value = image!.path;
    }
  }

  Future<void> postPengumuman() async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      Map<String, dynamic> postData = {
        'title': controllerTitle.value.text,
        'description': controllerDeskripsi.value.text,
      };

      // Buat objek multipart request untuk mengirim gambar (jika ada)
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"),
      );

      // Tambahkan data teks ke request
      postData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Tambahkan gambar ke request jika ada
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('photo', image!.path),
        );
      }

      // Kirim request
      var response = await request.send();

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Pengumuman ditambahkan dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Pengumuman berhasil ditambahkan');

        Get.snackbar(
          'Success',
          'Pengumuman berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menambah Pengumuman',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan pengumuman');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_informasi/models/kategori_informasi.dart';
import 'package:http/http.dart' as http;

class AdminTambahInformasiController extends GetxController {
  static AdminTambahInformasiController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataKategoriInformasi();
    isLoading.value = false;
  }

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/categories";

  // List Link API
  final linkApi = [].obs;

  // is Loading
  final isLoading = true.obs;

  // List KategoriInformasi
  final RxList<Map<String, dynamic>> listKategoriInformasi =
      <Map<String, dynamic>>[].obs;
  var listKategoriNameInformasi = [].obs;
  var listKategoriId = [].obs;
  // List TextEditingController
  RxList<TextEditingController> textController = <TextEditingController>[].obs;

  // Dropdown
  var selectedCategories = ''.obs;
  var selectedCategoriesId = "".obs;

  // Deskripsi
  var controllerDeskripsi = TextEditingController().obs;
  var description = "".obs;

  // Image
  File? imageInformasi;
  var imagePicker = ImagePicker();
  var pickedImageString = ''.obs;

  // Fetch API
  Future<KategoriInformasi> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        KategoriInformasi kategori = kategoriInformasiFromJson(response.body);
        return kategori;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<KategoriInformasi> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/categories?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        KategoriInformasi kategori = kategoriInformasiFromJson(response.body);
        return kategori;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Link API
  getLinkApi() async {
    try {
      var kategori = await fetchApi();
      linkApi.value = [];

      kategori.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataKategoriInformasi() async {
    try {
      await getLinkApi();
      listKategoriInformasi.value = [];
      listKategoriNameInformasi.value = [];
      listKategoriId.value = [];
      textController.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var kategori = await fetchPageApi(page: i + 1);
        kategori.data?.list?.forEach((data) {
          listKategoriInformasi.add({
            "id": data.id,
            "name": data.name,
          });

          listKategoriId.add(data.id);
          listKategoriNameInformasi.add(data.name);
          textController.add(TextEditingController(text: data.name));
        });
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Pick Image
  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      imageInformasi = File(pickedImage.path);
      pickedImageString.value = imageInformasi!.path;
    }
  }

  // Post Informasi
  Future<void> postInformasi() async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      Map<String, dynamic> postData = {
        'description': controllerDeskripsi.value.text,
        'categories_id': selectedCategoriesId.value,
        'categories_name': selectedCategories.value,
      };

      // Buat objek multipart request untuk mengirim gambar (jika ada)
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/information"),
      );

      // Tambahkan data teks ke request
      postData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Tambahkan gambar ke request jika ada
      if (imageInformasi != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          imageInformasi!.path,
        ));
      }

      var response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Informasi berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Informasi
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menambah Informasi',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

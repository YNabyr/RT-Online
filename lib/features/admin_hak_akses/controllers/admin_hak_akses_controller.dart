import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/admin_hak_akses/models/hak_akses.dart';
import 'package:http/http.dart' as http;

class AdminHakAksesController extends GetxController {
  static AdminHakAksesController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataHakAkses();
    isLoading.value = false;
  }

  // String Url API
  var apiUrl = "https://rtonline-api.venturo.pro/api/v1/roles";

  // List Link API
  var linkApi = [].obs;

  // is Loading
  var isLoading = false.obs;

  // List HakAkses
  RxList<Map<String, dynamic>> listHakAkses = <Map<String, dynamic>>[].obs;

  // Tambah Hak Akses
  var textController = TextEditingController();
  var selectedAdmin = false.obs;
  var selectedWarga = false.obs;

  // Edit Hak Akses
  var editInput = TextEditingController();
  var selectedEditAdmin = false.obs;
  var selectedEditWarga = false.obs;

  // Fetch API
  fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        HakAkses hakAkses = hakAksesFromJson(response.body);
        return hakAkses;
      } else {
        throw Exception("Gagal Mengambil data");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // Fetch Page API
  Future<HakAkses> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/roles?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        HakAkses hakAkses = hakAksesFromJson(response.body);
        return hakAkses;
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
      var hakAkses = await fetchApi();
      linkApi.value = [];

      hakAkses.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataHakAkses() async {
    try {
      await getLinkApi();
      listHakAkses.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var hakAkses = await fetchPageApi(page: i + 1);
        hakAkses.data?.list?.forEach((data) {
          listHakAkses.add({
            "id": data.id,
            "name": data.name,
            "acces": data.access,
          });
        });
      }

      print(listHakAkses);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Post Hak Akses
  Future<void> postAkses() async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = {
        "name": textController.text,
        "access": (selectedAdmin.value == true)
            ? "Admin"
            : (selectedWarga.value == true)
                ? "Warga"
                : "null",
      };

      // Buat objek request
      var response = await http.post(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/roles"),
        body: postData,
      );

      if (response.statusCode == 200) {
        // Akses berhasil ditambahkan

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Akses berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Akses
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah Akses',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Akses');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Edit Hak Akses
  Future<void> editAkses(String id) async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = {
        "id": id,
        "name": editInput.text,
        "access": (selectedEditAdmin.value == true)
            ? "Admin"
            : (selectedEditWarga.value == true)
                ? "Warga"
                : "null",
      };

      // Buat objek request
      var response = await http.put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/roles"),
        body: postData,
      );

      if (response.statusCode == 200) {
        // Akses berhasil ditambahkan

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Akses berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Akses
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah Akses',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Akses');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Delete Hak Akses
  Future<void> deleteHakAkses(String id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));

      if (response.statusCode == 200) {
        // Jika penghapusan berhasil, hapus juga dari list lokal
        listHakAkses.removeWhere((hakAkses) => hakAkses['id'] == id);
      } else {
        throw Exception('Gagal menghapus hak akses');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

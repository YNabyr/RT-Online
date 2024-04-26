import 'package:get/get.dart';

import '../models/pengumuman.dart';
import 'package:http/http.dart' as http;

class AdminPengumumanController extends GetxController {
  static AdminPengumumanController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataPengumuman();
    isLoading.value = false;
  }

  // String Url API
  var apiUrl = "https://rtonline-api.venturo.pro/api/v1/announcements";

  // List Link API
  var linkApi = [].obs;

  // is Loading
  var isLoading = false.obs;

  // List Pengumuman
  var listPengumuman = [].obs;
  var listPengumumanId = [].obs;
  var listPengumumanTitle = [].obs;
  var listPengumumanDescription = [].obs;
  var listPengumumanIsPinnedInt = [].obs;
  var listPengumumanIsPinned = [].obs;

  // Fetch API
  Future<Pengumuman> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Pengumuman pengumuman = pengumumanFromJson(response.body);
        return pengumuman;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<Pengumuman> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/announcements?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        Pengumuman pengumuman = pengumumanFromJson(response.body);
        return pengumuman;
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
      var pengumuman = await fetchApi();
      linkApi.value = [];

      pengumuman.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataPengumuman() async {
    try {
      await getLinkApi();
      listPengumuman.value = [];
      listPengumumanIsPinned.value = [];
      listPengumumanIsPinnedInt.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var pengumuman = await fetchPageApi(page: i + 1);
        pengumuman.data?.list?.forEach((data) {
          listPengumuman.add({
            "id": data.id,
            "title": data.title,
            "description": data.description,
            "photo_url": data.photoUrl,
            "created_at": data.createdAt,
            "is_pinned": data.isPinned,
          });

          listPengumumanIsPinnedInt.add(data.isPinned);

          listPengumumanIsPinned.add(data.isPinned == 1 ? true : false);
        });
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Edit Pengumuman
  Future<void> editPinPengumuman(
      String pengumumanId, String title, String description, String pin) async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      Map<String, dynamic> putData = {
        'id': pengumumanId,
        'title': title,
        'description': description,
        'is_pinned': pin,
      };

      // Kirim request
      var response = await http.put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"),
        body: putData,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Pengumuman berhasil diubah, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Pengumuman berhasil diubah');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Pengumuman berhasil diubah',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.closeAllSnackbars();
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

  // delete pengumuman
  Future<void> deletePengumuman(String pengumumanId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            "https://rtonline-api.venturo.pro/api/v1/announcements/$pengumumanId"),
      );

      if (response.statusCode == 200) {
        // Pengumuman dihapus dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Pengumuman berhasil dihapus');

        Get.closeAllSnackbars();
        Get.snackbar("Succes", "Pengumuman berhasil dihapus");
      } else {
        throw Exception('Gagal menghapus Pengumuman');
      }
    } catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar("Failed", "Gagal Menghapus Pengumuman");
      throw Exception('Error: $e');
    }
  }
}

// pengumuman_controller.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_pengumuman/models/pengumuman.dart';
import 'package:venturo_core/features/beranda/repositories/pengumuman_repository.dart';
import 'package:http/http.dart' as http;

class PengumumanController extends GetxController {
  static PengumumanController get to => Get.find();

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
  var detailIsLoading = false.obs;

  // List Pengumuman
  var listPengumuman = [].obs;
  var listPengumumanId = [].obs;
  var listPengumumanTitle = [].obs;
  var listPengumumanDescription = [].obs;
  var listPengumumanIsPinnedInt = [].obs;
  var listPengumumanIsPinned = [].obs;
  var listIsViewed = [].obs;

  // viewers
  RxList<Map<String, dynamic>>? listViewers = <Map<String, dynamic>>[].obs;

  // Get Detail Pengumuman
  Future<void> getDetailAnnouncements(String announcementsId) async {
    print(announcementsId);
    var response =
        await PengumumanRepository.getDetailAnnouncements(announcementsId);
    var detailAnnouncements = response.data;
    var listViewer =
        detailAnnouncements?.viewers?.map((e) => e.toJson()).toList();
    var listCitizenView = listViewer?.map((e) => e['citizen_id']).toList();
    var viewers = listViewer
        ?.where((e) => e['citizen_id'] != null)
        .map((e) => e)
        .toList(growable: true);
    listViewers!.value = viewers!;

    print("INI DETAIL ANNOUNCEMENTS : ");
    print(detailAnnouncements);
    print(viewers);
  }

  // get viewers id
  getViewersId(String announcementsId) async {
    var response = await PengumumanRepository.getViewers();
    var viewers = response.data!.map((e) => e.toJson()).toList();
    var viewersId =
        viewers.where((e) => e['announcement_id'] == announcementsId).toList();

    print("INI VIEWERS ID: ");
    print(viewersId);
  }

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
      listIsViewed.value = [];

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

          listIsViewed.add(false);

          listPengumumanIsPinnedInt.add(data.isPinned);

          listPengumumanIsPinned.add(data.isPinned == 1 ? true : false);
        });

        // listPengumumanIsPinned.sort((a, b) => b ? 1 : -1);

        // // Urutkan daftar pengumuman berdasarkan is_pinned
        // listPengumuman.sort((a, b) {
        //   if (a['is_pinned'] == 1 && b['is_pinned'] == 0) {
        //     return -1; // Geser a ke depan
        //   } else if (a['is_pinned'] == 0 && b['is_pinned'] == 1) {
        //     return 1; // Geser b ke depan
        //   } else {
        //     return 0; // Tetapkan urutan
        //   }
        // });

        // Urutkan daftar pengumuman berdasarkan is_pinned
        listPengumuman.sort((a, b) {
          // Geser pengumuman dengan is_pinned == 1 ke depan
          // Tetapkan urutan jika is_pinned sama
          return b['is_pinned'].compareTo(a['is_pinned']);
        });

        print("LIST PENGUMUMAN: ");
        print(listPengumuman);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Navigate to detail page
  void navigateToDetailPage(int index) {
    Map pengumuman = listPengumuman[index];
    var args = {
      'viewers': listViewers,
      'pengumuman': pengumuman,
    };

    print(args);

    Get.toNamed(Routes.detailPengumumanRoute, arguments: args);
  }
}

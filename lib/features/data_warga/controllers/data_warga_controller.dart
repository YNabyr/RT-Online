import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/penduduk.dart';
import '../view/components/data_warga_card.dart';

class DataWargaController extends GetxController {
  static DataWargaController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;

    await getDataPenduduk();

    isLoading.value = false;
  }

  // String Url API
  var apiUrl = "https://rtonline-api.venturo.pro/api/v1/citizen";

  // List Link API
  var linkApi = [].obs;

  // is Loading
  var isLoading = false.obs;

  // Penduduk
  var listPenduduk = [].obs;
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

// Fetch API
  Future<Penduduk> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Penduduk penduduk = pendudukFromJson(response.body);
        return penduduk;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<Penduduk> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/citizen?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        Penduduk penduduk = pendudukFromJson(response.body);
        return penduduk;
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
      var penduduk = await fetchApi();
      linkApi.value = [];

      penduduk.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataPenduduk() async {
    try {
      await getLinkApi();
      listPenduduk.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var penduduk = await fetchPageApi(page: i + 1);
        penduduk.data?.list?.forEach((data) {
          listPenduduk.add(
            {
              "id": data.id,
              "name": data.name,
              "nik": data.nik,
              "no_kk": data.noKk,
              "phone_number": data.phoneNumber,
              "email": data.email,
              "house_id": data.houseId,
              "dues_id": data.duesId,
              "gender": data.gender,
              "date_of_birth": data.dateOfBirth,
              "religion": data.religion,
              "roles_id": data.rolesId,
              "access": [
                for (var u = 0; u < data.access!.length; u++)
                  {
                    "admin": {
                      "view": data.access![u].admin!.view,
                      "create": data.access![u].admin!.create,
                      "update": data.access![u].admin!.update,
                      "delete": data.access![u].admin!.delete,
                    }
                  }
              ],
              "photo_url": data.photoUrl,
              "is_invited": data.isInvited,
              "is_verified": data.isVerified,
              "updated_security": data.updatedSecurity
            },
          );
        });
      }

      print(listPenduduk);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

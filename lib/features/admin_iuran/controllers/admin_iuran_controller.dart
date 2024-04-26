import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/constants/api_const.dart';
import 'package:venturo_core/features/admin_iuran/repositories/admin_iuran_repository.dart';
import 'package:venturo_core/features/admin_undang_warga/models/Iuran.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/data_blok/repositories/data_blok_repository.dart';
import 'package:venturo_core/features/data_warga/repositories/data_warga_repository.dart';
import 'package:venturo_core/utils/services/api_services.dart';

class AdminIuranController extends GetxController {
  static AdminIuranController get to => Get.find();
  static final Dio _dio = ApiServices.dioCall();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataIuran();
    await getDuesCategories();
    await getBlock();
    await getHouses();
    await getCitizen();
    getFilteredCitizen();

    isLoading.value = false;
  }

  // String Url API
  var apiUrl = "https://rtonline-api.venturo.pro/api/v1/dues";

  // List Link API
  var linkApi = [].obs;

  // is Loading
  var isLoading = false.obs;

  // iuran
  var listHouses = [].obs;
  var listBlock = [].obs;
  var listCitizen = [].obs;
  var listDuesCategories = [].obs;
  var filteredHouses = [].obs;
  var filteredCitizen = [].obs;

  RxList<Map<String, dynamic>> listIuran = <Map<String, dynamic>>[].obs;

  // Tambah Iuran
  var listField = [].obs;
  RxList<TextEditingController> listControllerJenisIuran =
      <TextEditingController>[].obs;
  RxList<TextEditingController> listControllerNominal =
      <TextEditingController>[].obs;
  var listNominal = [].obs;
  var totalNominal = 0.obs;

  // Edit Iuran
  var listFieldEdit = [].obs;
  var listIdIuran = [].obs;
  RxList<TextEditingController> listInputEditIuran =
      <TextEditingController>[].obs;
  RxList<TextEditingController> listInputEditNominal =
      <TextEditingController>[].obs;
  var listEditNominal = [].obs;
  var totalEditNominal = 0.obs;

  // Get Dues categories
  Future<void> getDuesCategories() async {
    try {
      var response = await AdminIuranRepository.getDuesCategories();
      listDuesCategories.value =
          response.data!.list!.map((e) => e.toJson()).toList();
      print("LIST KATEGORI IURAN : ");
      print(listDuesCategories);
    } catch (e) {
      print(e);
    }
  }

  // Get Block
  Future<void> getBlock() async {
    try {
      var response = await DataBlokRepository.getBlok();
      listBlock.value = response.data!.list!.map((e) => e.toJson()).toList();
      print("LIST BLOCKS : ");
      print(listBlock);
    } catch (e) {
      print(e);
    }
  }

  // Get Block
  Future<void> getHouses() async {
    try {
      var response = await DataBlokRepository.getHouse();
      listHouses.value = response.data!.list!.map((e) => e.toJson()).toList();
      print("LIST HOUSES : ");
      print(listHouses);
    } catch (e) {
      print(e);
    }
  }

  // Get Citizen
  getCitizen() async {
    try {
      var response = await DataWargaRepository.getCitizen();
      listCitizen.value = response.data!.list!.map((e) => e.toJson()).toList();
      for (var citizen in listCitizen) {
        // Ambil house_id dari citizen
        var citizenHouseId = citizen['house_id'];

        // Cari house yang sesuai dengan house_id
        var matchedHouse = listHouses.firstWhere(
            (house) => house['id'] == citizenHouseId,
            orElse: () => null);

        // Jika house ditemukan, tambahkan _name ke dalam citizen
        if (matchedHouse != null) {
          citizen['block_name'] = matchedHouse['block_name'];
        }
      }
      print("LIST CITIZEN : ");
      print(listCitizen);
    } catch (e) {
      print(e);
    }
  }

  // Get Filtered Citizen
  getFilteredCitizen() {
    filteredCitizen.value = [];
    for (var i = 0; i < listBlock.length; i++) {
      // Variable
      var listHouse = [].obs;
      var listDues = [].obs;
      var blockItem = listBlock[i];
      var citizen =
          listCitizen.where((e) => e['block_name'] == blockItem['name']);
      var listDuesId = listCitizen.map((e) => e['dues_id']).toList();
      var listId = citizen.map((e) => e['house_id']).toList();

      // For ListHouse & ListDues
      for (var u = 0; u < listId.length; u++) {
        var houseId = listId[u];
        var duesId = listDuesId[u];

        listHouse.add(listHouses
            .where((e) => e['id'] == houseId)
            .map((e) => e['house'])
            .elementAt(0));

        listDues.add(listIuran
            .where((e) => e['id'] == duesId)
            .map((e) => e['nominal_dues']));
      }

      // Add FilteredCitizen
      filteredCitizen.add({
        "name": blockItem['name'],
        'list_house': listHouse,
        'list_id': listId,
        "list_citizen": citizen.map((e) => e['id']).toList(),
        "list_dues": listDues,
      });
    }

    print('INI FILTERED CITIZEN :');
    print(filteredCitizen);
  }

  // Get Citizen Property
  getCitizenProperty(String id, {required String name}) {
    var property = listCitizen
        .where((e) => e['id'] == id)
        .map((e) => e[name])
        .elementAt(0)
        .toString();
    return property;
  }

  // Fetch API
  Future<Iuran> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Iuran iuran = iuranFromJson(response.body);
        return iuran;
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
      var iuran = await fetchApi();
      linkApi.value = [];

      iuran.data?.meta!.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<Iuran> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "https://rtonline-api.venturo.pro/api/v1/dues?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        Iuran iuran = iuranFromJson(response.body);
        return iuran;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Link API
  getDataIuran() async {
    try {
      await getLinkApi();
      listIuran.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var iuran = await fetchPageApi(page: i + 1);
        iuran.data?.list?.forEach((data) {
          listIuran.add({
            "id": data.id ?? "",
            "name": data.name ?? "",
            'detail': [
              for (var u = 0; u < data.detail!.length; u++)
                {
                  "id": data.detail![u].id ?? "",
                  "dues_id": data.detail![u].duesId ?? "",
                  "name": data.detail![u].name ?? "",
                  "nominal": data.detail![u].nominal ?? "",
                  "created_at": data.detail![u].createdAt ?? "",
                  "updated_at": data.detail![u].updatedAt ?? "",
                  "deleted_at": data.detail![u].deletedAt ?? "",
                  "created_by": data.detail![u].createdBy ?? "",
                  "updated_by": data.detail![u].updatedBy ?? "",
                  "deleted_by": data.detail![u].deletedBy ?? "",
                },
            ],
            "nominal_dues": data.nominalDues ?? "",
          });
        });
        //   // if (data.detail != null && data.detail!.isNotEmpty) {
        //   //   for (var detail in data.detail!) {
        //   //     listIuran.add({
        //   //       "id": data.id,
        //   //       "name": data.name,
        //   //       "detail": {
        //   //         "id": detail.id,
        //   //         "dues_id": detail.duesId,
        //   //         "name": detail.name
        //   //             ?.toString()
        //   //             .split('.')
        //   //             .last, // Get enum string value
        //   //         "nominal": detail.nominal,
        //   //         "created_at": detail.createdAt,
        //   //         "updated_at": detail.updatedAt,
        //   //         "deleted_at": detail.deletedAt,
        //   //         "created_by": detail.createdBy,
        //   //         "updated_by": detail.updatedBy,
        //   //         "deleted_by": detail.deletedBy,
        //   //       },
        //   //       "nominal_dues": data.nominalDues,
        //   //     });
        //   //   }
        //   // }
      }

      print('liAT IUrAN : ');
      print(listIuran);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // POST
  Future<void> postIuran(int index) async {
    try {
      var body = {
        "id": "null",
        "name": "null",
        "detail": [
          for (var i = 0; i < index; i++)
            {
              "name": listControllerJenisIuran[i].text,
              "nominal": listControllerNominal[i].text,
            }
        ]
      };

      var response = await http.post(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/dues"),
        body: jsonEncode(body),
        // Tentukan tipe konten sebagai application/json
        headers: {"Content-Type": "application/json"},
      );

      print(body);

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

  // Edit
  Future<void> editIuran(
    int index, {
    required String id,
    required RxList idIuran,
  }) async {
    try {
      var body = {
        "id": id,
        "name": "null",
        "detail": [
          for (var i = 0; i < index; i++)
            {
              "id": idIuran[i],
              "name": listInputEditIuran[i].text,
              "nominal": listInputEditNominal[i].text,
            }
        ]
      };
      print(body);

      var response = await http.put(
        Uri.parse(ApiConst.duesCategories),
        body: jsonEncode(body),
        // Tentukan tipe konten sebagai application/json
        headers: {"Content-Type": "application/json"},
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Kategori Informasi berhasil ditambahkan
        print('Kategori Informasi berhasil ditambahkan');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Kategori Informasi berhasil Diedit',
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
}

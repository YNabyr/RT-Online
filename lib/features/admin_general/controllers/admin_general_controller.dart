import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:venturo_core/features/admin_general/models/general.dart';

class AdminGeneralController extends GetxController {
  static AdminGeneralController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();

    isLoading.value = true;
    await getDataGeneral();
    addParameter();
    await getProvince();
    print(listGeneral);
    isLoading.value = false;
  }

  final box = GetStorage();

  // String Url API
  var apiUrl = "https://rtonline-api.venturo.pro/api/v1/residence";

  // List Link API
  var linkApi = [].obs;

  // is Loading
  var isLoading = false.obs;

  // Edit General
  var listGeneral = [].obs;
  var listProvince = [].obs;
  var listCity = [].obs;
  var listDistrict = [].obs;
  var listKodePos = [].obs;

  // dropdown
  var selectedProvince = ''.obs;
  var selectedCity = ''.obs;
  var selectedDistrict = ''.obs;
  var selectedKodePos = ''.obs;
  var selectedProvinceId = ''.obs;
  var selectedCityId = ''.obs;
  var selectedDistrictId = ''.obs;
  var selectedKodePosId = ''.obs;

  // Perumahan
  var controllerEditPerumahan = TextEditingController().obs;
  var controllerEditRT = TextEditingController().obs;
  var controllerEditRW = TextEditingController().obs;
  var controllerEditAlamat = TextEditingController().obs;
  var controllerEditProvinsi = TextEditingController().obs;
  var controllerEditKota = TextEditingController().obs;
  var controllerEditKecamatan = TextEditingController().obs;
  var controllerEditKodePos = TextEditingController().obs;
  var controllerEditPenanggungJawab = TextEditingController().obs;
  var controllerEditNoTelepon = TextEditingController().obs;

  // Edit Struktur RT
  var listStruktur = [].obs;
  var listController = [].obs;
  var listControllerEditNama = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ].obs;
  var listControllerEditJabatan = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ].obs;
  var controllerEditNama = TextEditingController().obs;
  var controllerEditJabatan = TextEditingController().obs;

  // List Akun Bank
  var controllerEditNamaBank = TextEditingController().obs;
  var controllerEditNoRekening = TextEditingController().obs;
  var controllerEditNamaPemilik = TextEditingController().obs;

  // Argumem
  var data = {}.obs;

  // Add Paramater
  addParameter() {
    // Data
    data.value = {
      "id": controllerEditPerumahan.value.text,
      "rt": listGeneral[0]["rt"].toString(),
      "rw": listGeneral[0]["rw"].toString(),
      "address": listGeneral[0]["address"].toString(),
      "province": listGeneral[0]["province"].toString(),
      "city": listGeneral[0]["city"].toString(),
      "district": listGeneral[0]["district"].toString(),
      "post_code": listGeneral[0]["post_code"].toString(),
      "responsible_person": AdminGeneralController
          .to.listGeneral[0]["responsible_person"]
          .toString(),
      "phone_number": listGeneral[0]["phone_number"].toString(),
      "bank_id": listGeneral[0]['bank']['id'].toString(),
      "bank_name": listGeneral[0]['bank']['name'].toString(),
      "bank_no_rek": listGeneral[0]['bank']['no_rek'].toString(),
      "bank_holder_name": listGeneral[0]['bank']['holder_name'].toString(),
      "structure_id": [
        for (var u = 0; u < listGeneral[0]['structure'].length; u++)
          listGeneral[0]['structure'][u]["id"],
      ],
      "structure_position": [
        for (var u = 0; u < 4; u++) listGeneral[0]['structure'][u]["position"],
      ],
      "structure_citizen_id": [
        for (var u = 0; u < listGeneral[0]['structure'].length; u++)
          listGeneral[0]['structure'][u]["citizen_id"],
      ],
    };
  }

  // Fetch API
  Future<General> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        General general = generalFromJson(response.body);
        return general;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<General> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "https://rtonline-api.venturo.pro/api/v1/residence?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        General general = generalFromJson(response.body);
        return general;
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
      var general = await fetchApi();
      linkApi.value = [];

      general.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataGeneral() async {
    try {
      await getLinkApi();
      listGeneral.value = [];
      listController.value = [];
      listStruktur.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var general = await fetchPageApi(page: i + 1);

        general.data?.list?.forEach((data) {
          // Menangani nilai structure jika lebih dari 1
          listGeneral.add({
            "id": data.id,
            "rt": data.rt,
            "rw": data.rw,
            "address": data.address,
            "province": data.province,
            "city": data.city,
            "district": data.district,
            "post_code": data.postCode,
            "responsible_person": data.responsiblePerson,
            "phone_number": data.phoneNumber,
            "bank": {
              "id": data.bank?.id,
              "name": data.bank?.name,
              "no_rek": data.bank?.noRek,
              "holder_name": data.bank?.holderName,
            },
            "structure": [
              for (var u = 0; u < data.structure!.length; u++)
                {
                  "id": data.structure![u].id,
                  "position": data.structure![u].position,
                  "citizen_id": data.structure![u].citizenId,
                },
            ],
          });
        });

        print("LIST GENERAL INI");
        print(":");
        print(listGeneral);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // POST
  Future<void> editGeneral() async {
    try {
      var body = {
        "id": "242ad87f-a79d-439a-b3dd-09fff28fbf44",
        "rt": controllerEditRT.value.text,
        "rw": controllerEditRW.value.text,
        "address": controllerEditAlamat.value.text,
        "province": selectedProvince.value,
        "city": selectedCity.value,
        "district": selectedDistrict.value,
        "post_code": selectedKodePos.value,
        "responsible_person": controllerEditPenanggungJawab.value.text,
        "phone_number": controllerEditNoTelepon.value.text,
        "bank": {
          "id": "028f7a02-7b05-4afc-8ce2-6e20a2907e1a",
          "name": controllerEditNamaBank.value.text,
          "no_rek": controllerEditNoRekening.value.text,
          "holder_name": controllerEditNamaPemilik.value.text,
        },
        "structure": [
          {
            "id": "36557d9f-e5cf-4c43-9c92-02fcf7f7d7ba",
            "position": listControllerEditJabatan[0].value.text,
            "citizen_id": listControllerEditNama[0].value.text,
          },
          {
            "id": "667528e7-08fa-4fee-b893-e317f72540e2",
            "position": listControllerEditJabatan[1].value.text,
            "citizen_id": listControllerEditNama[1].value.text,
          },
          {
            "id": "a4d718ec-8329-4f2e-b4af-835b4c65fec1",
            "position": listControllerEditJabatan[2].value.text,
            "citizen_id": listControllerEditNama[2].value.text,
          },
          {
            "id": "d68ef507-8107-4542-91a8-f6c31c1a5b48",
            "position": listControllerEditJabatan[3].value.text,
            "citizen_id": listControllerEditNama[3].value.text,
          }
        ]
      };

      var response = await http.put(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/residence"),
        body: jsonEncode(body),
        // Tentukan tipe konten sebagai application/json
        headers: {"Content-Type": "application/json"},
      );

      print(body);

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Kategori Informasi berhasil ditambahkan
        print('General berhasil diedit');

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'General berhasil Diedit',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Kategori Informasi
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Edit Genreal',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Kategori Informasi');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fungsi untuk mendapatkan data Province
  Future<void> getProvince() async {
    try {
      listProvince.value = [];
      final response = await http.get(Uri.parse(
          "https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json"));

      if (response.statusCode == 200) {
        // Parsing data JSON
        List<dynamic> decodedData = json.decode(response.body);

        // Memasukkan data ke dalam variabel listProvince
        listProvince.value = decodedData;
        print(listProvince);
      } else {
        print(response.body);
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fungsi untuk mendapatkan data Province
  Future<void> getCity() async {
    try {
      listCity.value = [];
      final response = await http.get(Uri.parse(
          "https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$selectedProvinceId.json"));

      if (response.statusCode == 200) {
        // Parsing data JSON
        List<dynamic> decodedData = json.decode(response.body);

        // Memasukkan data ke dalam variabel listCity
        listCity.value = decodedData;
        print(listCity);
      } else {
        print(response.body);
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fungsi untuk mendapatkan data Province
  Future<void> getDistrict() async {
    try {
      listDistrict.value = [];
      final response = await http.get(Uri.parse(
          "https://emsifa.github.io/api-wilayah-indonesia/api/districts/$selectedCityId.json"));

      if (response.statusCode == 200) {
        // Parsing data JSON
        List<dynamic> decodedData = json.decode(response.body);

        // Memasukkan data ke dalam variabel listDistrict
        listDistrict.value = decodedData;
        print(listDistrict);
      } else {
        print(response.body);
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

// Fungsi untuk mendapatkan data kode pos
  Future<void> getKodePos() async {
    try {
      // Mengosongkan nilai listKodePos sebelum melakukan request
      listKodePos.value = [];

      final response = await http.get(
          Uri.parse("https://kodepos.vercel.app/?q=${selectedDistrict.value}"));

      if (response.statusCode == 200) {
        // Parsing data JSON
        var decodedData = json.decode(response.body);
        List<dynamic> data = decodedData['data'];

        // Mencocokkan dengan selectedDistrict menggunakan ekspresi reguler
        RegExp regex =
            RegExp(r'\b' + RegExp.escape(selectedDistrict.value) + r'\b');
        List<String> filteredData = [];
        for (var item in data) {
          String village = item['village'].toString().toUpperCase();
          if (regex.hasMatch(village)) {
            filteredData.add(item['code'].toString());
          }
        }

        // Menambahkan kode pos ke dalam listKodePos
        listKodePos.addAll(filteredData);

        print(listKodePos);
      } else {
        // Menampilkan pesan jika terjadi kesalahan dalam permintaan HTTP
        print("Failed to load data, status code: ${response.statusCode}");
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      // Menangani kesalahan yang terjadi selama proses
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}

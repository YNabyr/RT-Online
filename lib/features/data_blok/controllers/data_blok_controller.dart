import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/features/data_blok/models/blok.dart';
import 'package:venturo_core/features/data_blok/models/house.dart';
import 'package:venturo_core/features/data_warga/controllers/data_warga_controller.dart';
import 'package:venturo_core/features/data_warga/repositories/data_warga_repository.dart';

class DataBlokController extends GetxController {
  static DataBlokController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataBlok();
    await getDataHouse();
    await getHouseId();
    await DataWargaRepository.getDataPenduduk(listPenduduk);
    print(listPenduduk);

    isLoading.value = false;
  }

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/blocks";

  // List Link API
  final linkApi = [].obs;
  final linkApiHouse = [].obs;

  // is Loading
  final isLoading = true.obs;

  // Blok
  var listBlok = [].obs;
  RxList<TextEditingController> textController = <TextEditingController>[].obs;
  var tambahBlok = ''.obs;

  // Penduduk
  var listPenduduk = [].obs;

  // Blok
  var controllerNoRumah = TextEditingController();
  var tambahNoRumah = ''.obs;
  List<Map<String, dynamic>> listNamaBlok = [];
  var listTextEditingController = <TextEditingController>[];

  RxList<Map<String, dynamic>> houseInfoList = <Map<String, dynamic>>[].obs;

  // houses
  RxList<Map<String, dynamic>> listHouses = <Map<String, dynamic>>[].obs;
  var houseId = [].obs;
  var houses = <House>[].obs;
  var filteredHouseIds = [].obs;

  List<Map<String, String>> idNameList = [];

// ignore: unnecessary_cast
  Rx<String?> selectedItems = (null as String?).obs;
  // ignore: unnecessary_cast
  Rx<String?> yourObject = (null as String?).obs;

  // HOuse ID
  getHouseId() async {
    for (int i = 0; i < listBlok.length; i++) {
      var blockItem = listBlok[i];

      // Filter rumah yang memiliki block_name yang sesuai dengan nama blok saat ini
      var matchingHouses = listHouses
          .where((houseItem) => houseItem['block_name'] == blockItem['name'])
          .toList();

      var listId = matchingHouses.map((houseItem) => houseItem['id']).toList();

      print("LIST ID =");
      print(listId);

      // Tambahkan informasi blok dan daftar ID rumah yang sesuai ke dalam filteredHouseIds
      filteredHouseIds.add({
        "name": blockItem['name'],
        "list_id": matchingHouses.map((houseItem) => houseItem['id']).toList(),
        "list_house": matchingHouses.map((e) => e['house'].toString()).toList(),
      });

      print(filteredHouseIds);
    }

//  for (var blk in listBlok) {
//   // Filter rumah yang memiliki block_name yang sesuai dengan nama blok saat ini
//   var filteredHouses = listHouses
//       .where((hse) => hse['block_name'] == blk['name'])
//       .map((hse) => hse['id'])
//       .toList();

//   // Tambahkan informasi blok dan daftar ID rumah yang sesuai ke dalam filteredHouseId
//   filteredHouseIds.add({
//     "name": blk['name'],
//     "list_id": filteredHouses,
//   });
// }

    print(listBlok.length);
    print("");
    print('FILTERED HOUSE :');
    print(
        filteredHouseIds); // Output: {R: [e8f640ab-211d-46d4-ad9a-875366b5623f, b6236293-6faf-477d-b4cc-5c097b239931, a21da6f6-654b-4e21-bc84-8e447b28d4dd, 2a7cf7d0-f0e4-4a2c-9ed6-55842b4fc37e], H: [e8c231d0-d307-45d3-95de-f2647f45717b, 63d1ce7d-63b2-41c2-b064-5a310637e89a], I: [c88ab6dc-42e3-4279-823e-28c8faa1d20b, a2b9377e-a9b7-4270-a25a-18482f3fb35d, 5a2c34d1-6113-4b7a-8988-ef470a1af8ee], E: [3976d12b-2123-429d-b3ef-ca2f4fd70c36]}
  }

  bool isHouseValid(String houseId) {
    print("INI HOSUE ID:");
    print(houseId);

    // Ubah set ke dalam list
    var penduduk = listPenduduk.toList();

    // Memeriksa apakah house_id pada penduduk terdapat di dalam daftar rumah
    bool isHouseIdValid = penduduk.any((house) {
      // Ubah ini agar sesuai dengan struktur data
      print(house['house_id']);
      // Bandingkan dengan houseId

      return house['house_id'] == houseId ? true : false;
    });

    print(isHouseIdValid);
    return isHouseIdValid;
  }

  // Fetch API
  Future<Blok> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Blok blok = blokFromJson(response.body);
        return blok;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<Blok> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/blocks?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        Blok blok = blokFromJson(response.body);
        return blok;
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
      var blok = await fetchApi();
      linkApi.value = [];

      blok.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataBlok() async {
    try {
      await getLinkApi();
      listBlok.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var blok = await fetchPageApi(page: i + 1);
        blok.data?.list?.forEach((data) {
          listBlok.add({
            "id": data.id,
            "name": data.name,
          });

          textController.add(TextEditingController(text: data.name));
        });
      }
      print("INI LISTBLOK");
      print(listBlok);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Link API
  getLinkApiHouse() async {
    try {
      var house = await fetchDataHouse();
      linkApiHouse.value = [];

      house.data?.meta?.links?.forEach((link) {
        linkApiHouse.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

// Fetch Page API
  Future<House> fetchPageApiHouse({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/houses?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        House house = houseFromJson(response.body);
        return house;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<House> fetchDataHouse() async {
    try {
      // Gantilah URL ini dengan URL API yang sesuai
      final response = await http
          .get(Uri.parse('https://rtonline-api.venturo.pro/api/v1/houses'));

      if (response.statusCode == 200) {
        // Jika respons sukses, konversi JSON menjadi objek House
        return houseFromJson(response.body);
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  // Get Data
  getDataHouse() async {
    try {
      await getLinkApiHouse();
      houseInfoList.value = [];
      listHouses.value = [];

      for (var i = 0; i < linkApiHouse.length; i++) {
        var house = await fetchPageApiHouse(page: i + 1);
        house.data?.list?.forEach((listElement) {
          listHouses.add({
            'id': listElement.id,
            'block_id': listElement.blockId,
            'block_name': listElement.blockName,
            'house_number': listElement.houseNumber,
            'house': listElement.house,
          });

          houseInfoList.add({
            'id': listElement.id,
            'block_id': listElement.blockId,
            'block_name': listElement.blockName,
            'house_number': listElement.houseNumber,
            'house': listElement.house,
          });

          houseId.value = listHouses
              .where((e) => e['block_name'] == listBlok[i]['name'])
              .map((e) => e['house'])
              .toList();
        });

        print(listHouses);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // delete house
  Future<void> deleteHouse(String houseId) async {
    try {
      final response = await http.delete(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/houses/$houseId"),
      );

      if (response.statusCode == 200) {
        // House dihapus dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('House berhasil dihapus');

        Get.closeAllSnackbars();
        Get.snackbar("Succes", "House berhasil dihapus");
      } else {
        throw Exception('Gagal menghapus House');
      }
    } catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar("Failed", "Gagal Menghapus House");
      throw Exception('Error: $e');
    }
  }

  void addDataHouse() async {
    try {
      houseInfoList.value = [];
      House house = await fetchDataHouse();

      house.data?.list?.forEach((listElement) {
        houseInfoList.add({
          'id': listElement.id,
          'block_id': listElement.blockId,
          'block_name': listElement.blockName,
          'house_number': listElement.houseNumber,
          'house': listElement.house,
        });
      });
      print(houseInfoList);
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> postBlok() async {
    print(listNamaBlok);
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = listNamaBlok;

      // Buat objek multipart request untuk mengirim gambar (jika ada)
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/blocks"),
      );

      for (var i = 0; i < postData.length; i++) {
        postData[i].forEach((key, value) {
          request.fields[key] = value;
        });
      }

      // Kirim request
      var response = await request.send();

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Blok ditambahkan dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan

        Get.snackbar(
          'Success',
          'Blok berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Blok
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menambah Blok',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Blok');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // delete blok
  Future<void> deleteBlok(
    String blokId, {
    Function()? onRemove,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/blocks/$blokId"),
      );

      if (response.statusCode == 200) {
        onRemove;
        // Blok dihapus dengan sukses, Anda dapat melakukan tindakan tambahan jika diperlukan
        print('Blok berhasil dihapus');
        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Kategori Blok Berhasil Dihapus',
          snackPosition: SnackPosition.TOP,
        );

        // Kemudian, perbarui data Blok
      } else {
        Get.snackbar(
          'Failed',
          'Gagal Menghapus Kategori Blok',
          snackPosition: SnackPosition.TOP,
        );

        throw Exception('Gagal menghapus Blok');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

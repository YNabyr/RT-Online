import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/models/informasi.dart';
import 'package:http/http.dart' as http;

class InformasiController extends GetxController {
  static InformasiController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await getDataInformasi();
    isLoading.value = false;
  }

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/information";

  // List Link API
  final linkApi = [].obs;

  // is Loading
  final isLoading = false.obs;

  // List Informasi
  final listInformasi = [].obs;

  // Fetch API
  Future<Informasi> fetchApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Informasi informasi = informasiFromJson(response.body);
        return informasi;
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch Page API
  Future<Informasi> fetchPageApi({required int page}) async {
    try {
      final response = await http.get(Uri.parse(
          "http://rtonline-api.venturo.pro/api/v1/information?sort=id%20DESC&page=$page"));

      if (response.statusCode == 200) {
        Informasi informasi = informasiFromJson(response.body);
        return informasi;
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
      var informasi = await fetchApi();
      linkApi.value = [];

      informasi.data?.meta?.links?.forEach((link) {
        linkApi.add(link);
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get Data
  getDataInformasi() async {
    try {
      await getLinkApi();
      listInformasi.value = [];

      for (var i = 0; i < linkApi.length; i++) {
        var informasi = await fetchPageApi(page: i + 1);
        informasi.data?.list?.forEach((data) {
          listInformasi.add({
            "id": data.id,
            "description": data.description,
            "photo_url": data.photoUrl,
            "categories_id": data.categoriesId,
            "categories_name": data.categoriesName,
          });
        });
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

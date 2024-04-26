import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:venturo_core/features/admin_pengumuman/constants/admin_pengumuman_api_constant.dart';
import 'package:venturo_core/features/admin_pengumuman/models/pengumuman.dart';
import 'package:http/http.dart' as http;

class AdminPengumumanRepository {
  AdminPengumumanRepository._();

  var apiConstant = AdminPengumumanApiConstant();

  File? image;

  List<Map<String, dynamic>> listPengumuman = [];

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  Future<Pengumuman> fetchDataPengumuman() async {
    try {
      final response = await http.get(
          Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"));

      if (response.statusCode == 200) {
        return pengumumanFromJson(response.body);
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void addDataPengumuman() async {
    try {
      Pengumuman pengumuman = await fetchDataPengumuman();

      pengumuman.data?.list?.forEach((listElement) {
        listPengumuman.add({
          'id': listElement.id,
          'title': listElement.title,
          'description': listElement.description,
          'photo_url': listElement.photoUrl,
          'created_at': listElement.createdAt,
          'is_pinned': listElement.isPinned,
        });
      });

      print(listPengumuman);
    } catch (e) {}
  }
}

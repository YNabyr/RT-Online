import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/constants/api_const.dart';
import 'package:venturo_core/features/admin_pengumuman/models/pengumuman.dart';
import 'package:venturo_core/features/beranda/models/detail_announcements.dart';
import 'package:venturo_core/features/beranda/models/viewers.dart';
import 'package:venturo_core/utils/services/api_services.dart';

class PengumumanRepository extends GetxController {
  PengumumanRepository._();

  static final Dio _dio = ApiServices.dioCall();

  // Get Annnouncements
  static Future<Pengumuman> getAnnouncements() async {
    try {
      var response = await _dio.get(ApiConst.announcements);
      Pengumuman announcements = Pengumuman.fromJson(response.data);

      // If statuscode == 200
      if (response.statusCode == 200) {
        return announcements;
      } else {
        return Pengumuman(message: "ERROR");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get Detail Pengumuman
  static Future<DetailAnnouncements> getDetailAnnouncements(
      String announcementsId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("access_token");
      final Dio dio = ApiServices.dioCall(authorization: token);
      var response =
          await dio.get("${ApiConst.announcements}/$announcementsId");

      DetailAnnouncements announcements =
          DetailAnnouncements.fromJson(response.data);

      print("INI VIEWERS : ");
      print(response.statusCode);
      if (response.statusCode == 200) {
        return announcements;
      } else {
        return DetailAnnouncements(message: "Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get Viewers
  static Future<Viewers> getViewers() async {
    try {
      var response = await _dio.get("${ApiConst.viewers}/");

      Viewers viewers = Viewers.fromJson(response.data);

      print("INI VIEWERS : ");
      print(response.statusCode);
      if (response.statusCode == 200) {
        return viewers;
      } else {
        return Viewers(message: "Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

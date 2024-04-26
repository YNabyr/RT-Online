import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:venturo_core/constants/api_const.dart';
import 'package:venturo_core/features/data_blok/models/blok.dart';
import 'package:venturo_core/utils/services/api_services.dart';

import '../constants/data_blok_api_constant.dart';
import '../models/house.dart';

class DataBlokRepository {
  DataBlokRepository._();

  var apiConstant = DataBlokApiConstant();
  static final Dio _dio = ApiServices.dioCall();

  // Get House
  static Future<House> getHouse() async {
    try {
      // Call API House using method POST
      var response = await _dio.get(ApiConst.house);

      House house = House.fromJson(response.data);

      // Set UserInfop
      if (response.statusCode == 200) {
        return house;
      } else {
        return House(message: "Error");
      }
    } catch (e) {
      print(e);
      return House(message: "Server Error".tr);
    }
  }

  // Get Blok
  static Future<Blok> getBlok() async {
    try {
      // Call API Blok using method POST
      var response = await _dio.get(ApiConst.block);

      Blok block = Blok.fromJson(response.data);

      // Set UserInfo
      if (response.statusCode == 200) {
        return block;
      } else {
        return Blok(message: "Error");
      }
    } catch (e) {
      print(e);
      return Blok(message: "Server Error".tr);
    }
  }
}

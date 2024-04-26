import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/profile/constants/profile_api_constant.dart';
import 'package:venturo_core/utils/services/api_services.dart';
import 'package:venturo_core/utils/services/local_db_services.dart';

import '../../../constants/api_const.dart';
import '../../../shared/models/login.dart';

class ProfileRepository {
  ProfileRepository._();

  var apiConstant = ProfileApiConstant();
  static final Dio _dio = ApiServices.dioCall();

  // Call API
  static getUser(String phoneNumber, String password) async {
    try {
      // Call API Login using method POST
      var response = await _dio.post(ApiConst.login, data: {
        "phone_number": phoneNumber,
        "password": password,
      });

      Login login = Login.fromJson(response.data);

      print(phoneNumber);
      print(password);
      print(response.statusCode);
      // Set UserInfo
      if (response.statusCode == 200) {
        await LocalDBServices.clearUser();
        await LocalDBServices.setUser(login, password);
        await LocalDBServices.getUser(phoneNumber, password);

        // Show snackbar if usename or password is wrong
        Get.closeAllSnackbars();
        Get.snackbar(
          "Sukses".tr,
          'Sukses'.tr,
        );
      } else {
        // Show snackbar if usename or password is wrong
        Get.closeAllSnackbars();
        Get.snackbar(
          "Something Went Wrong".tr,
          login.message ?? "Unknown Error".tr,
        );
      }

      return login;
    } catch (e) {
      print(e);
      return Login(message: "Server Error".tr);
    }
  }
}

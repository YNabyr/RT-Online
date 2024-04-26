import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:venturo_core/constants/api_const.dart';

import '../../../configs/routes/route.dart';
import '../../../shared/models/login.dart';
import '../../../utils/services/api_services.dart';
import '../../../utils/services/local_db_services.dart';
import '../constants/auth_api_constant.dart';

class AuthRepository {
  AuthRepository._();

  var apiConstant = AuthApiConstant();
  static final Dio _dio = ApiServices.dioCall();

  // Call API login
  static Future<Login> getUser(String phoneNumber, String password) async {
    try {
      // Call API Login using method POST
      var response = await _dio.post(ApiConst.login, data: {
        "phone_number": phoneNumber,
        "password": password,
      });

      Login login = Login.fromJson(response.data);

      print(response.statusCode);
      // Set UserInfo
      if (response.statusCode == 200) {
        await LocalDBServices.clearUser();
        await LocalDBServices.setUser(login, password);

        Get.offAllNamed(Routes.dashboardRoute);
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

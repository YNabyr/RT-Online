import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:venturo_core/constants/api_const.dart';
import 'package:venturo_core/features/admin_iuran/constants/admin_iuran_api_constant.dart';
import 'package:venturo_core/features/admin_undang_warga/models/Iuran.dart';
import 'package:venturo_core/utils/services/api_services.dart';

class AdminIuranRepository {
  AdminIuranRepository._();

  var apiConstant = AdminIuranApiConstant();
  static final Dio _dio = ApiServices.dioCall();

  // Get Kategori Iuran
  static Future<Iuran> getDuesCategories() async {
    try {
      // Call API House using method POST
      var response = await _dio.get(ApiConst.duesCategories);

      Iuran duesCategory = Iuran.fromJson(response.data);

      print("INI API KATEGORI IURAN :");
      print(response.statusCode);
      // Set UserInfop
      if (response.statusCode == 200) {
        return duesCategory;
      } else {
        return Iuran(message: "Error");
      }
    } catch (e) {
      print(e);
      return Iuran(message: "Server Error".tr);
    }
  }
}

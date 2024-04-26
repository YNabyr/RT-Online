import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:venturo_core/configs/routes/route.dart';

class InvitationController extends GetxController {
  static InvitationController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    namaController.text = 'Krisna Maulana';
    telpController.text = '081234567800';
    emailController.text = 'krisna@gmail.com';
  }

  // Form
  var namaController = TextEditingController();
  var telpController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // String Url API
  final apiUrl = "https://rtonline-api.venturo.pro/api/v1/auth/invitation";

  // Post
  Future<void> postInvitation() async {
    try {
      // Persiapkan data untuk dikirimkan ke server
      var postData = {
        "password": passwordController.text,
        "phone_number": telpController.text,
      };

      // Buat objek request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(apiUrl),
      );

      postData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Kirim request dan dapatkan response
      var response = await request.send();

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Invitation berhasil ditambahkan
        print('Invitation berhasil ditambahkan');

        Get.toNamed(Routes.dashboardRoute);

        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Invitation berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
        // Kemudian, perbarui data Invitation
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Menambah Invitation',
          snackPosition: SnackPosition.TOP,
        );
        throw Exception('Gagal menambahkan Invitation');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

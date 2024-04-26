import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/constants/api_const.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';
import 'package:venturo_core/features/data_blok/repositories/data_blok_repository.dart';
import 'package:venturo_core/features/data_warga/repositories/data_warga_repository.dart';
import 'package:venturo_core/features/profile/repositories/profile_repository.dart';
import 'package:venturo_core/utils/services/api_services.dart';
import 'package:venturo_core/utils/services/local_db_services.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  static final Dio _dio = ApiServices.dioCall();

  @override
  void onInit() async {
    super.onInit();

    print('INI PROFILE CONTROLLER :');

    await getHouseList();
    await getUserInfo();

    // Init
    controllerNoKK.value.text = userInfo['no_kk'];
    controllerNoNIK.value.text = userInfo['nik'];
    // controllerPekerjaan.value.text = listUser[''];
    controllerTanggalLahir.value.text = userInfo['date_of_birth'];
    controllerNoHandphone.value.text = userInfo['phone_number'];
    controllerAgama.value.text = userInfo['religion'];
    controllerPasswordSekarang.text = userPassword.value;
    selectedGender.value = userInfo['gender'];
  }

  // Variable
  var badge = "".obs;
  var userPassword = ''.obs;
  RxMap<String, dynamic> userInfo = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> citizenList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> houseList = <Map<String, dynamic>>[].obs;

  // Edit Profile
  File? image;
  var pickedImage = "".obs;

  // Input
  var controllerNoKK = TextEditingController().obs;
  var controllerNoNIK = TextEditingController().obs;
  var controllerPekerjaan = TextEditingController().obs;
  var controllerTanggalLahir = TextEditingController().obs;
  var controllerAgama = TextEditingController().obs;
  var controllerNoHandphone = TextEditingController().obs;
  var controllerPasswordSekarang = TextEditingController();
  var controllerPasswordBaru = TextEditingController();
  var controllerKonfirmasiPasswordBaru = TextEditingController();
  var selectedGender = ''.obs;

  // Get UserInfo
  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userInfo.value = await jsonDecode(prefs.getString('userInfo')!);
    userPassword.value = prefs.getString('userPassword')!;
    print(userInfo);
    print(userPassword);

    // Get House
    var value = houseList
        .where((e) => e['id'] == userInfo['house_id'])
        .map((e) => e["house"]);

    if (value.toString() == '()') {
      badge.value == 'null';
    } else {
      badge.value = value.elementAt(0).toString();
    }
  }

  // Get HouseList
  Future<void> getHouseList() async {
    var response = await DataBlokRepository.getHouse();
    houseList.value = response.data!.list!.map((e) => e.toJson()).toList();
    print(houseList);
  }

  // Get CitizenList
  Future<void> getCitizenList() async {
    var response = await DataWargaRepository.getCitizen();
    citizenList.value = response.data!.list!.map((e) => e.toJson()).toList();
    print(citizenList);
  }

  // Fungsi untuk mengambil gambar
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // Jika gambar berhasil diambil, lakukan sesuatu (misalnya: menyimpan gambar)
      image = File(pickedFile.path);
      pickedImage.value = image!.path;
      print(pickedImage.value);
    } else {
      //
    }
  }

  // Fungsi untuk menampilkan bottom sheet
  void showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Pilihan untuk memilih dari kamera
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () async {
                  await pickImage(ImageSource.camera);
                },
              ),
              // Pilihan untuk memilih dari folder
              ListTile(
                leading: const Icon(Icons.folder),
                title: const Text('Folder'),
                onTap: () async {
                  await pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Edit Profile
  Future<void> editProfile() async {
    try {
      var response = await _dio.put(
        ApiConst.citizen,
        data: {
          "id": userInfo['id'],
          "nik": controllerNoNIK.value.text,
          "no_kk": controllerNoKK.value.text,
          "gender": selectedGender.value,
          "religion": controllerAgama.value.text,
          "photo_url": pickedImage.value,
          "phone_number": controllerNoHandphone.value.text,
          "date_of_birth": controllerTanggalLahir.value.text,
          "name": userInfo['name'],
          "house_id": userInfo['house_id'],
          "dues_id": userInfo['dues_id'],
          "roles_id": userInfo['roles_id'],
          "email": userInfo['email'],
          "password": userPassword.value,
        },
      );

      print(controllerNoHandphone.value.text);
      print(userPassword.value);
      print(response.statusCode);
      if (response.statusCode == 200) {
        await ProfileRepository.getUser(
            controllerNoHandphone.value.text, userPassword.value);
        Get.snackbar("Berhasil", "berhasil");
      } else {
        Get.snackbar("Gagal", "Gagal");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Logout
  Future<void> logout() async {
    // Clear login status and user details in shared preferences
    await LocalDBServices.clearUser();
    Get.toNamed(Routes.loginRoute);
  }
}

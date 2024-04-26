import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:venturo_core/features/admin_hak_akses/controllers/admin_hak_akses_controller.dart';
import 'package:http/http.dart' as http;

class AdminUndangWargaController extends GetxController {
  static AdminUndangWargaController get to => Get.find();

  var controllerHakAkses = Get.put(AdminHakAksesController());

  // Form
  File? image;
  var pickedImage = "".obs;
  var nameController = TextEditingController();
  var nikController = TextEditingController();
  var nokkController = TextEditingController();
  var tlpController = TextEditingController();
  var genderController = TextEditingController();
  var tempatTglController = TextEditingController();
  var agamaController = TextEditingController();
  var passwordController = TextEditingController();
  var hakAksesController = TextEditingController();
  var isInvited = false.obs;

  // list HakAkses
  var listHakAkses = AdminHakAksesController.to.listHakAkses;

  // Dropdown
  var selectedBlok = ''.obs;
  var selectedBlokId = ''.obs;
  var selectedIuran = ''.obs;
  var selectedIuranId = ''.obs;
  var selectedHakAkses = ''.obs;
  var selectedHakAksesId = "".obs;
  var selectedGender = ''.obs;
  var selectedGenderId = "".obs;
  var blokTapped = false.obs;
  var hakTapped = false.obs;
  var iuranTapped = false.obs;
  var genderTapped = false.obs;

  // Fungsi untuk mengambil gambar
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // image = File(pickedFile.path);
      // pickedImage.value = image!.path;

      // List<int> imageBytes = [];
      // // Membaca file gambar sebagai bytes
      // imageBytes = await File(pickedImage.toString()).readAsBytes();

      // // Mengonversi bytes gambar menjadi format base64
      // pickedImage.value = base64Encode(imageBytes);

      // Jika gambar berhasil diambil, lakukan sesuatu (misalnya: menyimpan gambar)
      image = File(pickedFile.path);
      pickedImage.value = image!.path;
      print(pickedImage.value);
    } else {
      // Jika tidak, tampilkan pesan atau lakukan sesuatu yang sesuai dengan kebutuhan aplikasi Anda
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

  onTapped(bool tapped) {
    if (tapped == false) {
      tapped = !tapped;
    } else {
      tapped = !tapped;
    }
  }

  Widget switchIcon(bool tapped) {
    if (tapped == false) {
      return SvgPicture.asset("assets/outline/arrow-ios-down.svg");
    } else {
      return SvgPicture.asset("assets/outline/arrow-ios-up.svg");
    }
  }

  // POST
  Future<void> postData() async {
    try {
      // Definisikan URL endpoint untuk POST request
      var url = Uri.parse('https://rtonline-api.venturo.pro/api/v1/citizen');

      // Buat request multipart
      var request = http.MultipartRequest('POST', url);

      // Data yang akan ditambahkan ke dalam request
      var requestData = {
        "nik": nikController.text,
        "name": nameController.text,
        "email": 'dummy@gmail.com',
        "no_kk": nokkController.text,
        "gender": selectedGender.value,
        "dues_id": selectedIuranId.value,
        "house_id": selectedBlokId.value,
        "password": passwordController.text,
        "religion": agamaController.text,
        "roles_id": selectedHakAksesId.value,
        "is_invited": isInvited.value == false ? '0' : '1',
        "is_verified": '1',
        "phone_number": tlpController.text,
        "date_of_birth": tempatTglController.text,
      };

      print(requestData);

      // Tambahkan data ke dalam request
      requestData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Tambahkan file gambar ke dalam request
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('photo', pickedImage.value),
        );
      }

      // Kirim request dan dapatkan response
      var response = await request.send();

      // Periksa status code dari response
      if (response.statusCode == 200) {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          "Undang Warga berhasil",
          snackPosition: SnackPosition.TOP,
        );
        // Jika request berhasil, cetak response
        print('Response: ${response.statusCode}');
      } else {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Failed',
          'Gagal Mengundang Warga',
          snackPosition: SnackPosition.TOP,
        );
        // Jika request gagal, cetak pesan error
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

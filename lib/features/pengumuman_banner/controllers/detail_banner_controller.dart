import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:venturo_core/features/pengumuman_banner/repositories/detail_banner_repository.dart';

class DetailBannerController extends GetxController {
  static DetailBannerController get to => Get.find();

  final DetailBannerRepository _repository = DetailBannerRepository();
  DetailBannerRepository get repository {
    return _repository;
  }

  var jumlahBaca = [].obs;

  RxList<String> imageUrls = <String>[].obs;

  @override
  void onInit() {
    // Inisialisasi imageUrls dengan data dari repository
    imageUrls.assignAll(_repository.getImageUrls().reversed.take(4));
    jumlahBaca.assignAll(_repository.getImageUrls());

    super.onInit();
  }

  void showImagePreview(BuildContext context, String imageUrl) {
    // Tampilkan dialog dengan gambar
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: PhotoView.customChild(
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              initialScale: PhotoViewComputedScale.contained,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

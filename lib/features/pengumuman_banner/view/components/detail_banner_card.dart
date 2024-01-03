// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/detail_banner_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DetailBannerCard extends StatelessWidget {
  DetailBannerCard({super.key});

  final DetailBannerController controller = Get.find();

  final List<String> imageUrls = Get.arguments['imageUrls'];
  final int index = Get.arguments['index'];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> bannerData =
        controller.repository.getBannerData(index);

    // Container Card
    return Container(
      padding: EdgeInsets.all(12.w),
      width: 382.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 15,
            offset: Offset(4, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          // Banner + Judul Container
          Container(
            width: 358.w,
            padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 15.w),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFB5B7C4), width: 1),
              ),
            ),
            child: Column(
              children: [
                // Banner
                Container(
                  width: 350.w,
                  height: 177.w,
                  color: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                15.verticalSpace,

                // Text Judul
                SizedBox(
                  width: 342.w,
                  child: Text(
                    bannerData['title'],
                    style: NunitoTextStyle.fw600.copyWith(
                      color: const Color(0xFF0B0C0D),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          15.verticalSpace,

          // Container Content
          Container(
            padding: EdgeInsets.all(8.w),
            width: 358.w,
            child:
                // Text Content
                Text(
              bannerData['content'],
              textAlign: TextAlign.justify,
              style: NunitoTextStyle.fw300.copyWith(
                color: const Color(0xFF0B0C0D),
                fontSize: 13.sp,
              ),
            ),
          ),

          15.verticalSpace,

          // Footer Banner
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Color(0xffB5B7C4)),
              ),
            ),
            child: Row(
              children: [
                // Text
                Text(
                  'Warga yang telah membaca',
                  style: NunitoTextStyle.fw400.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 10.sp,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                // Profil
                buildImagesStack(),

                4.horizontalSpace,

                // Text
                Text(
                  '+${(controller.jumlahBaca.length) - (controller.imageUrls.length)}',
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ); // Container card
  }

  Widget buildImagesStack() {
    // List berisi posisi kiri dari setiap gambar
    List<double> positions = [0, 12, 24, 36];

    return SizedBox(
      width: 56.w,
      height: 20.w,
      child: Obx(
        () => Stack(
          children: List.generate(DetailBannerController.to.imageUrls.length,
              (index) {
            String imageUrl = DetailBannerController.to.imageUrls[index];
            return Positioned(
              left: positions[index].w,
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF6454F0)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/pengumuman_banner/controllers/detail_banner_controller.dart';
import 'package:venturo_core/features/pengumuman_banner/view/components/detail_banner_card.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class DetailPengumumanCard extends StatelessWidget {
  DetailPengumumanCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;

    final String title = args?['title'] ?? '';
    final String head = args?['head'] ?? '';
    final String date = args?['date'] ?? '';
    final String content = args?['content'] ?? '';
    final String kategori = args?['kategori'] ?? '';
    final String dateDetail = args?['date_detail'] ?? '';

    // Container Card
    return Container(
      width: 382.w,
      padding: EdgeInsets.all(12.w),
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

      // Container Column
      child: Column(
        children: [
          // Container Column Title, date, kategori
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: const Color(0xFFB5B7C4), width: 1.w),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: NunitoTextStyle.fw600.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 16.sp,
                  ),
                ),

                8.verticalSpace,

                // Row
                Row(
                  children: [
                    // Date Detail
                    Text(
                      dateDetail,
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 10.sp,
                      ),
                    ),
                    // Divider
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '|',
                        style: NunitoTextStyle.fw400.copyWith(
                          color: const Color(0xFF0B0C0D),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),

                    // Kategori
                    Text(
                      kategori,
                      style: NunitoTextStyle.fw400.copyWith(
                        color: const Color(0xFF0B0C0D),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          24.verticalSpace,

          // Container Column Head, Content
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Head
                Text(
                  head,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),

                8.verticalSpace,

                // Content
                Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: NunitoTextStyle.fw300.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

          24.verticalSpace,

          // Footer Pengumuman
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
    );
  }

  DetailBannerController controller = Get.put(DetailBannerController());

  Widget buildImagesStack() {
    // List berisi posisi kiri dari setiap gambar
    List<double> positions = [0, 12, 24, 36];

    return SizedBox(
      width: 56.w,
      height: 20.w,
      child: Obx(
        () => Stack(
          children: List.generate(controller.imageUrls.length, (index) {
            String imageUrl = controller.imageUrls[index];
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_informasi/controllers/admin_informasi_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ListAdminInformasi extends StatelessWidget {
  const ListAdminInformasi({super.key});

  static const boxShadow = BoxShadow(
    color: Color(0x19000000),
    blurRadius: 8,
    offset: Offset(4, 3),
    spreadRadius: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        shrinkWrap: true,
        itemCount: AdminInformasiController.to.listInformasi.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                decoration: const ShapeDecoration(
                  color: Color(0xFFD40202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  shadows: [boxShadow],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // icon trash

                    SvgPicture.asset(
                      "assets/fill/ic_trash_2.svg",
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      height: 24.h,
                    ),

                    20.5.horizontalSpace,
                  ],
                ),
              ),
            ),
            key: ValueKey(
                AdminInformasiController.to.listInformasi[index]['id']),
            onDismissed: (DismissDirection direction) {
              try {
                AdminInformasiController.to.deleteInformasi(
                    AdminInformasiController.to.listInformasi[index]['id']);
                AdminInformasiController.to.listInformasi.removeAt(index);
              } catch (e) {
                throw Exception(e);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                height: 98.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [boxShadow],
                ),
                child: Row(
                  children: [
                    // Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Judul
                          Text(
                            (AdminInformasiController.to.listInformasi[index]
                                        ['categories_name'] ==
                                    null)
                                ? "Null"
                                : AdminInformasiController
                                    .to.listInformasi[index]['categories_name'],
                            style: NunitoTextStyle.fw700.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 16.sp,
                            ),
                          ),

                          // Deskripsi
                          Text(
                            AdminInformasiController.to.listInformasi[index]
                                ['description'],
                            maxLines: 2,
                            style: NunitoTextStyle.fw400.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 13.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),

                    15.horizontalSpace,

                    // icon
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.adminEditInformasiRoute,
                          arguments: {
                            "id": AdminInformasiController
                                .to.listInformasi[index]['id'],
                            "description": AdminInformasiController
                                .to.listInformasi[index]['description'],
                            "categories_id": AdminInformasiController
                                .to.listInformasi[index]['categories_id'],
                            "categories_name": AdminInformasiController
                                .to.listInformasi[index]['categories_name'],
                            "photo": AdminInformasiController
                                .to.listInformasi[index]['photo_url'],
                          },
                        );
                      },
                      child: SvgPicture.asset("assets/outline/edit.svg"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

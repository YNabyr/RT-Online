import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_pengumuman/controllers/admin_pengumuman_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class ListAdminPengumuman extends StatefulWidget {
  const ListAdminPengumuman({Key? key}) : super(key: key);

  @override
  State<ListAdminPengumuman> createState() => _ListAdminPengumumanState();
}

class _ListAdminPengumumanState extends State<ListAdminPengumuman> {
  @override
  void dispose() async {
    super.dispose();

    // Check if enableList has changes
    bool hasChanges = false;
    for (int i = 0;
        i < AdminPengumumanController.to.listPengumuman.length;
        i++) {
      if (AdminPengumumanController.to.listPengumumanIsPinnedInt[i] !=
          AdminPengumumanController.to.listPengumuman[i]['is_pinned']) {
        hasChanges = true;
        break;
      }
    }

    if (hasChanges == true) {
      AdminPengumumanController.to.isLoading.value = true;
      // AdminPengumumanController.to.listPengumumanIsPinnedInt.value = [];
      // AdminPengumumanController.to.listPengumumanIsPinnedInt.value =
      //     AdminPengumumanController.to.listPengumumanIsPinned
      //         .map((value) => value ? 1 : 0)
      //         .toList()
      //         .obs;
      // When the widget is disposed, update the pinned status
      for (int i = 0;
          i < AdminPengumumanController.to.listPengumuman.length;
          i++) {
        AdminPengumumanController.to.editPinPengumuman(
          AdminPengumumanController.to.listPengumuman[i]['id'],
          AdminPengumumanController.to.listPengumuman[i]['title'],
          AdminPengumumanController.to.listPengumuman[i]['description'],
          AdminPengumumanController.to.listPengumumanIsPinnedInt[i].toString(),
        );
      }
      AdminPengumumanController.to.isLoading.value = false;
    }
  }

  // var listPin = List.generate(
  //         AdminPengumumanController.to.listPengumuman.length,
  //         (index) => AdminPengumumanController.to.listPengumumanIsPinned[index])
  //     .obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        shrinkWrap: true,
        itemCount: AdminPengumumanController.to.listPengumuman.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                decoration: const ShapeDecoration(
                  color: Color(0xFFD40202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 8,
                      offset: Offset(4, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // icon trash
                    SvgPicture.asset(
                      "assets/fill/ic_trash_2.svg",
                      height: 24.h,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),

                    20.5.horizontalSpace,
                  ],
                ),
              ),
            ),
            key: ValueKey(
                AdminPengumumanController.to.listPengumuman[index]['id']),
            onDismissed: (DismissDirection direction) {
              AdminPengumumanController.to.deletePengumuman(
                  AdminPengumumanController.to.listPengumuman[index]['id']);
              AdminPengumumanController.to.listPengumuman.removeAt(index);
              AdminPengumumanController.to.listPengumumanIsPinned
                  .removeAt(index);
              AdminPengumumanController.to.listPengumumanIsPinnedInt
                  .removeAt(index);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                height: 98.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 8,
                      offset: Offset(4, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    // Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // judul
                          Text(
                            AdminPengumumanController.to.listPengumuman[index]
                                ["title"],
                            overflow: TextOverflow.ellipsis,
                            style: NunitoTextStyle.fw700.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 16.sp,
                            ),
                          ),

                          // isi
                          Text(
                            AdminPengumumanController.to.listPengumuman[index]
                                ["description"],
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

                    // switch
                    Obx(
                      () => Switch(
                        value: AdminPengumumanController
                            .to.listPengumumanIsPinned[index],
                        onChanged: (value) {
                          AdminPengumumanController
                              .to.listPengumumanIsPinned[index] = value;
                          AdminPengumumanController
                                  .to.listPengumumanIsPinnedInt[index] =
                              (value == true) ? 1 : 0;
                        },
                      ),
                    ),

                    15.horizontalSpace,

                    // icon
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.adminEditPengumumanRoute,
                          arguments: {
                            "id": AdminPengumumanController
                                .to.listPengumuman[index]['id'],
                            "title": AdminPengumumanController
                                .to.listPengumuman[index]['title'],
                            "description": AdminPengumumanController
                                .to.listPengumuman[index]['description'],
                            "photo": AdminPengumumanController
                                .to.listPengumuman[index]['photo_url'],
                            "is_pinned": AdminPengumumanController
                                .to.listPengumuman[index]['is_pinned'],
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

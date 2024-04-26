// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:venturo_core/features/admin_informasi/controllers/admin_tambah_informasi_controller.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_dropdown_button2.dart';

class DropdownAdminInformasi extends StatefulWidget {
  DropdownAdminInformasi({
    Key? key,
    this.label,
    this.hintText,
    this.isEdit = false,
    this.value,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final bool? isEdit;
  dynamic value;

  @override
  State<DropdownAdminInformasi> createState() => _DropdownAdminInformasiState();
}

class _DropdownAdminInformasiState extends State<DropdownAdminInformasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        (widget.label != null)
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  widget.label!,
                  textAlign: TextAlign.start,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              )
            : Container(),

        Container(
          width: 332.w,
          height: 42.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Obx(
            () => CustomDropdownButton2(
              buttonWidth: 332.w,
              dropdownWidth: 332.w,
              hint: "Pilih Kategori Informasi",
              value:
                  AdminTambahInformasiController.to.selectedCategories.value ==
                          ''
                      ? null
                      : widget.value,
              dropdownItems: AdminTambahInformasiController
                  .to.listKategoriNameInformasi
                  .map<String>((element) => element)
                  .toSet()
                  .toList(),
              onChanged: (items) {
                setState(() {
                  widget.value = items;
                  AdminTambahInformasiController.to.selectedCategories.value =
                      items!;
                });

                AdminTambahInformasiController.to.selectedCategoriesId.value =
                    AdminTambahInformasiController.to.listKategoriInformasi
                        .where((e) => e.containsValue(items))
                        .map((e) => e['id'])
                        .elementAt(0)
                        .toString();

                print(AdminTambahInformasiController
                    .to.selectedCategoriesId.value);
              },
            ),
          ),
        )
      ],
    );
  }
}

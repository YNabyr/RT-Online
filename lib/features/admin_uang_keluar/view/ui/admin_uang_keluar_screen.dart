import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_uang_keluar/constants/admin_uang_keluar_assets_constant.dart';
import 'package:venturo_core/features/admin_uang_keluar/controllers/admin_uang_keluar_controller.dart';
import 'package:venturo_core/features/admin_uang_keluar/repositories/admin_uang_keluar_repository.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/components/card_admin_uang_keluar.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/components/topbar_admin_uang_keluar.dart';
import 'package:venturo_core/features/admin_uang_keluar/view/ui/admin_tambah_uang_keluar.screen.dart';
import 'package:venturo_core/features/admin_uang_masuk/view/components/topbar_admin_uang_masuk.dart';
import 'package:venturo_core/shared/controllers/global_vairable.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';
import 'package:venturo_core/shared/widgets/custom_header_admin.dart';

class AdminUangKeluarScreen extends StatelessWidget {
  AdminUangKeluarScreen({Key? key}) : super(key: key);

  final assetsConstant = AdminUangKeluarAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // var listUangKeluar = AdminUangKeluarController.to.listDate
    //     .where((element) => element.containsValue(
    //           AdminUangKeluarController.to.dateTapped.value,
    //         ))
    //     .toList();
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Obx(
        () => Column(
          children: [
            // Stack
            Stack(
              children: [
                // Container(
                //   height: (AdminUangKeluarController.to.isFilter.value == false)
                //       ? 135.h + (64.h - 42.h)
                //       : 135.h,
                // ),

                // Header
                CustomHeaderAdmin(
                  title: "Uang Keluar",
                  suffixIcon: "assets/fill/Plus-Square.svg",
                  onTap: () {
                    Get.toNamed(Routes.adminTambahUangKeluarRoute);
                  },
                ),

                (AdminUangKeluarController.to.isFilter.value == false)
                    ?
                    // Button
                    Container(
                        margin:
                            EdgeInsets.only(top: 78.h + safePadding(context)),
                        child: Center(
                          child: Obx(
                            () => TopbarAdminUangKeluar(
                              text: "Oktober",
                              isFilter: false,
                              onTapIcCalendar: () {
                                AdminUangKeluarController.to.isFilter.value =
                                    !AdminUangKeluarController
                                        .to.isFilter.value;
                              },
                              tanggal: [
                                buildTgl(
                                  text1: formatHari(AdminUangKeluarController
                                      .to.dateNow.value
                                      .toString()),
                                  text2: formatTanggalBulan(
                                      AdminUangKeluarController.to.dateNow.value
                                          .toString()),
                                  onTap: () {
                                    AdminUangKeluarController
                                        .to.indexOnScope.value = 0;

                                    AdminUangKeluarController
                                            .to.selectedDate.value =
                                        AdminUangKeluarController
                                            .to.dateNow.value;
                                    print(AdminUangKeluarController
                                        .to.selectedDate.value);
                                  },
                                  onScope: (AdminUangKeluarController
                                              .to.indexOnScope.value ==
                                          (AdminUangKeluarController
                                                  .to.onScope.length -
                                              3))
                                      ? true
                                      : false,
                                ),
                                buildTgl(
                                  text1: formatHari(AdminUangKeluarController
                                      .to.dateNow.value
                                      .add(const Duration(days: 1))
                                      .toString()),
                                  text2: formatTanggalBulan(
                                      AdminUangKeluarController.to.dateNow.value
                                          .add(const Duration(days: 1))
                                          .toString()),
                                  onTap: () {
                                    AdminUangKeluarController
                                        .to.indexOnScope.value = 1;

                                    AdminUangKeluarController
                                            .to.selectedDate.value =
                                        AdminUangKeluarController
                                            .to.dateNow.value
                                            .add(const Duration(days: 1));
                                    print(AdminUangKeluarController
                                        .to.selectedDate.value);
                                  },
                                  onScope: (AdminUangKeluarController
                                              .to.indexOnScope.value ==
                                          (AdminUangKeluarController
                                                  .to.onScope.length -
                                              2))
                                      ? true
                                      : false,
                                ),
                                buildTgl(
                                  text1: formatHari(AdminUangKeluarController
                                      .to.dateNow.value
                                      .add(const Duration(days: 2))
                                      .toString()),
                                  text2: formatTanggalBulan(
                                      AdminUangKeluarController.to.dateNow.value
                                          .add(const Duration(days: 2))
                                          .toString()),
                                  onTap: () {
                                    AdminUangKeluarController
                                        .to.indexOnScope.value = 2;
                                    AdminUangKeluarController
                                            .to.selectedDate.value =
                                        AdminUangKeluarController
                                            .to.dateNow.value
                                            .add(const Duration(days: 2));
                                    print(AdminUangKeluarController
                                        .to.selectedDate.value);
                                  },
                                  onScope: (AdminUangKeluarController
                                              .to.indexOnScope.value ==
                                          (AdminUangKeluarController
                                                  .to.onScope.length -
                                              1))
                                      ? true
                                      : false,
                                ),
                              ],
                              onTapLeft: () {
                                // Logic
                                if (AdminUangKeluarController
                                        .to.indexOnScope.value ==
                                    0) {
                                  //  tanggal
                                  AdminUangKeluarController.to.dateNow.value =
                                      AdminUangKeluarController.to.dateNow.value
                                          .subtract(const Duration(days: 1));
                                  AdminUangKeluarController
                                          .to.selectedDate.value =
                                      AdminUangKeluarController
                                          .to.selectedDate.value
                                          .subtract(const Duration(days: 1));
                                  AdminUangKeluarController
                                      .to.selectedDay.value -= 3;

                                  // Atur indexOnScope
                                  AdminUangKeluarController
                                      .to.indexOnScope.value = 0;
                                } else if (AdminUangKeluarController
                                        .to.indexOnScope.value !=
                                    0) {
                                  AdminUangKeluarController
                                          .to.selectedDate.value =
                                      AdminUangKeluarController
                                          .to.selectedDate.value
                                          .subtract(const Duration(days: 1));
                                  AdminUangKeluarController
                                      .to.selectedDay.value -= 2;
                                  AdminUangKeluarController
                                      .to.indexOnScope.value -= 1;
                                }
                                print(AdminUangKeluarController
                                    .to.selectedDate.value);
                                print(AdminUangKeluarController
                                    .to.indexOnScope.value);
                              },
                              onTapRight: () {
                                // Logic
                                if (AdminUangKeluarController
                                        .to.indexOnScope.value ==
                                    2) {
                                  AdminUangKeluarController.to.dateNow.value =
                                      AdminUangKeluarController.to.dateNow.value
                                          .add(const Duration(days: 1));
                                  AdminUangKeluarController
                                          .to.selectedDate.value =
                                      AdminUangKeluarController
                                          .to.selectedDate.value
                                          .add(const Duration(days: 1));
                                  AdminUangKeluarController
                                      .to.selectedDay.value -= 1;
                                  AdminUangKeluarController
                                      .to.indexOnScope.value = 2;
                                } else if (AdminUangKeluarController
                                        .to.indexOnScope.value !=
                                    2) {
                                  AdminUangKeluarController
                                          .to.selectedDate.value =
                                      AdminUangKeluarController
                                          .to.selectedDate.value
                                          .add(const Duration(days: 1));
                                  AdminUangKeluarController
                                      .to.selectedDay.value -= 2;
                                  AdminUangKeluarController
                                      .to.indexOnScope.value += 1;
                                }
                                print(AdminUangKeluarController
                                    .to.selectedDate.value);
                                print(AdminUangKeluarController
                                    .to.indexOnScope.value);
                              },
                            ),
                          ),
                        ),
                      )
                    : // Button
                    Container(
                        margin:
                            EdgeInsets.only(top: 78.h + safePadding(context)),
                        child: Center(
                          child: Obx(
                            () => TopbarAdminUangMasuk(
                              // text: (AdminUangKeluarController.to.monthName.value == '')
                              //     ? AdminUangKeluarController.to.monthName.value =
                              //         DateFormat('MMMM').format(DateTime.now())
                              //     : AdminUangKeluarController.to.monthName.value,

                              text: DateFormat.MMMM().format(
                                  AdminUangKeluarController
                                      .to.calendarController.displayDate!),

                              onTapLeft: () {
                                AdminUangKeluarController
                                    .to.calendarController.backward!();
                                AdminUangKeluarController.to.selectedMonth - 1;

                                AdminUangKeluarController.to.monthName.value =
                                    DateFormat('MMMM').format(DateTime(
                                        AdminUangKeluarController
                                            .to.selectedYear.value,
                                        AdminUangKeluarController
                                            .to.selectedMonth.value));

                                print(AdminUangKeluarController
                                    .to.monthName.value);
                              },
                              onTapRight: () {
                                AdminUangKeluarController
                                    .to.calendarController.forward!();
                                AdminUangKeluarController.to.selectedMonth + 1;

                                AdminUangKeluarController.to.monthName.value =
                                    DateFormat('MMMM').format(DateTime(
                                        AdminUangKeluarController
                                            .to.selectedYear.value,
                                        AdminUangKeluarController
                                            .to.selectedMonth.value));
                              },
                              onTap: () {
                                AdminUangKeluarController.to.isFilter.value =
                                    !AdminUangKeluarController
                                        .to.isFilter.value;
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            ),

            25.verticalSpace,

            (AdminUangKeluarController.to.isFilter.value == true)
                ?
                // Calendar
                Column(
                    children: [
                      Container(
                        width: 382.w,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: SfCalendar(
                          viewHeaderStyle: ViewHeaderStyle(
                            dayTextStyle: NunitoTextStyle.fw800.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 13.sp,
                            ),
                          ),
                          headerDateFormat: "MMMM",
                          headerStyle: CalendarHeaderStyle(
                            textAlign: TextAlign.center,
                            textStyle: NunitoTextStyle.fw600.copyWith(
                              color: const Color(0xFF0B0C0D),
                              fontSize: 16.sp,
                            ),
                          ),
                          cellBorderColor: Colors.white,
                          blackoutDatesTextStyle:
                              NunitoTextStyle.fw800.copyWith(
                            color: const Color(0xFFD40202),
                            fontSize: 13.sp,
                          ),
                          timeZone: "SE Asia Standard Time",
                          view: CalendarView.month,
                          monthViewSettings: MonthViewSettings(
                            dayFormat: "EEE",
                            showTrailingAndLeadingDates: false,
                            monthCellStyle: MonthCellStyle(
                              textStyle: NunitoTextStyle.fw800.copyWith(
                                color: const Color(0xFF0B0C0D),
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          controller:
                              AdminUangKeluarController.to.calendarController,
                          // initialSelectedDate:
                          //     AdminUangKeluarController.to.selectedDate.value,
                          // initialDisplayDate:
                          //     AdminUangKeluarController.to.selectedDate.value,
                          onTap: (CalendarTapDetails details) {
                            DateTime date = details.date!;

                            AdminUangKeluarController.to.dateTapped.value =
                                AdminUangKeluarController.to
                                    .formatDateTapped(date.toString());
                            print(
                                AdminUangKeluarController.to.dateTapped.value);
                            dynamic appointments = details.appointments;
                            CalendarElement view = details.targetElement;
                            print(details.date);
                            print(appointments);
                            print(view);
                          },

                          onViewChanged: (ViewChangedDetails details) {
                            DateTime displayDate = details.visibleDates[0];
                            AdminUangKeluarController.to.calendarController
                                .displayDate = displayDate;
                            // Lakukan sesuatu dengan displayDate
                            print("Display date: $displayDate");
                          },
                        ),
                      ),
                      21.verticalSpace
                    ],
                  )
                : Container(),

            // Card
            Expanded(
              child: ListView.builder(
                itemCount: AdminUangKeluarController.to.listUangKeluar.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 15.w, left: 24.w, right: 24.w),
                    child: CardAdminUangKeluar(
                      keteranganPengeluaran: AdminUangKeluarController
                          .to.listUangKeluar[index]['keterangan_pengeluaran']
                          .toString(),
                      total: AdminUangKeluarController.to.listUangKeluar[index]
                          ['total'],
                      date: AdminUangKeluarController.to.formatTanggal(
                        AdminUangKeluarController.to.listUangKeluar[index]
                            ['date'],
                      ),
                      detailPengeluaran: AdminUangKeluarController
                          .to.listUangKeluar[index]['detail_pengeluaran'],
                      keterangan:
                          AdminUangKeluarController.to.listUangKeluar[index]
                              ['detail_pengeluaran'][0]['keterangan'],
                      banyak: AdminUangKeluarController.to.listUangKeluar[index]
                          ['detail_pengeluaran'][0]['banyak'],
                      nominal:
                          AdminUangKeluarController.to.listUangKeluar[index]
                              ['detail_pengeluaran'][0]['nominal'],
                      isFilter: AdminUangKeluarController.to.isFilter.value,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

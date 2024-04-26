import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/auth/controllers/auth_controller.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox.dart';
import 'package:venturo_core/shared/widgets/custom_checkbox_2.dart';
import 'package:venturo_core/shared/widgets/custom_dropdown_button2.dart';

import 'configs/pages/page.dart';
import 'configs/themes/theme.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Venturo Core',
          debugShowCheckedModeBanner: false,

          // locale: const Locale('id'),
          // fallbackLocale: const Locale('id'),
          // supportedLocales: const [
          //   Locale('en', 'US'),
          //   Locale('id'),
          // ],
          // initialBinding: , Jika memiliki global bindding
          initialRoute: Routes.loginRoute,
          theme: themeLight,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
        );
      },
    );
  }
}

class CustomTest extends StatefulWidget {
  const CustomTest({super.key});

  @override
  State<CustomTest> createState() => _CustomTestState();
}

class _CustomTestState extends State<CustomTest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Swipe Tab Demo'),
        ),
        body: Column(
          children: [
            SizedBox(
              width: 100.w,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: const TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                    Tab(text: "A"),
                  ],
                ),
              ),
            ),
            const Expanded(
                child: TabBarView(children: [
              Text('A'),
              Text('A'),
              Text('A'),
              Text('A'),
              Text('A'),
              Text('A'),
              Text('A'),
              Text('A'),
            ])),
          ],
        ),
      ),
    );
  }
}

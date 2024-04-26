import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/data_blok/models/blok.dart';

class CobaApi extends StatelessWidget {
  const CobaApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CobaApiView(),
    );
  }
}

class CobaApiView extends StatelessWidget {
  final CobaApiController controller = Get.put(CobaApiController());

  CobaApiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              itemCount: controller.bloks.length,
              itemBuilder: (BuildContext context, int index) {
                Blok blok = controller.bloks[index];
                return const Card(
                  child: ListTile(
                    title: Text(''),
                    subtitle: Text(''),
                  ),
                );
              },
            ),
    );
  }
}

class CobaApiController extends GetxController {
  var isLoading = true.obs;
  var bloks = <Blok>[].obs;
}

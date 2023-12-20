import 'dart:io';
import 'generator_helper.dart';

class GeneratorModuleData {
  static String getImportCurPackage() {
    var package = Directory.current;
    String namePackage = (package.path).split('/').last;
    return "import 'package:$namePackage";
  }

  static String assets({
    required String nameFeature,
  }) {
    String data = """
    class ${nameFeature}AssetsConstant {
    final String example = 'example';
    }""";
    return data;
  }

  static String api({
    required String nameFeature,
  }) {
    String data = """
    class ${nameFeature}ApiConstant {
    final String example = 'example';
    }""";
    return data;
  }

  static String controller({
    required String nameFeature,
  }) {
    String data = """import 'package:get/get.dart';
    class ${nameFeature}Controller extends GetxController {
    static ${nameFeature}Controller get to => Get.find();
    }""";
    return data;
  }

  static String binding({
    required String nameFeature,
    required String nameClassScreen,
    required String controllerPath,
  }) {
    String moduleNameSnakeCase =
        DataConverter.camelCaseToSnakeCase(nameFeature);
    String importPathController =
        '${getImportCurPackage()}/$controllerPath${moduleNameSnakeCase}_controller.dart'
            .replaceAll('/lib/', '/');

    String data = """import 'package:get/get.dart';
    $importPathController';
    class ${nameFeature}Binding extends Bindings {
      @override
      void dependencies() {
        Get.put(${nameFeature}Controller());
      }
    }
    """;
    return data;
  }

  static String repository({
    required String nameFeature,
    required String nameClassScreen,
    required String constantPath,
  }) {
    String moduleNameSnakeCase =
        DataConverter.camelCaseToSnakeCase(nameFeature);
    String importPathApiConstant =
        '${getImportCurPackage()}/$constantPath${moduleNameSnakeCase}_api_constant.dart'
            .replaceAll('/lib/', '/');

    String data = """$importPathApiConstant';
    class ${nameClassScreen}Repository {
      ${nameClassScreen}Repository._();

      var apiConstant = ${nameFeature}ApiConstant();
    }
    """;
    return data;
  }

  static String screen({
    required String nameFeature,
    required String nameClassScreen,
    required String constantPath,
  }) {
    String moduleNameSnakeCase =
        DataConverter.camelCaseToSnakeCase(nameFeature);
    String importPathAssetsConst =
        '${getImportCurPackage()}/$constantPath${moduleNameSnakeCase}_assets_constant.dart'
            .replaceAll('/lib/', '/');

    String data = """
  import 'package:flutter/material.dart';
  $importPathAssetsConst';
  class ${nameClassScreen}Screen extends StatelessWidget {
    ${nameClassScreen}Screen({Key? key}):super(key: key);

    final assetsConstant = ${nameFeature}AssetsConstant();
    @override
    Widget build(BuildContext context) {
      return const Scaffold();
    }
  }
    """;

    return data;
  }
}

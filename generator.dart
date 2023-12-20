// ignore_for_file: avoid_print

import 'dart:io';

import 'generator_module.dart';
import 'generator_helper.dart';

String rootPath = "lib/";
String modulesPath = "${rootPath}features/";
String configsPath = "${rootPath}configs/";

void main(List arguments) {
  print('\n----------------------Choose--------------------------\n'
      '0. Membuat Fitur\n'
      '1. Membuat Sub Fitur\n'
      '------------------------------------------------------\n');

  print('Masukkan Index : ');
  String resInput = InputUser.input();
  if (['0', '1'].contains(resInput) == false) {
    print('Index yang kamu inputkan salah!');
    return;
  }

  switch (resInput) {
    case '0':
      Generate.createFeature();
      break;
    case '1':
      Generate.createSubFeature();
      break;
    default:
  }

  return;
}

class Generate {
  static void createFeature() async {
    print('Inputkan Nama Fitur : (Format UpperCamelCase Contoh: SignIn)');
    String? featureName = stdin.readLineSync();
    if (featureName == null || featureName.isEmpty) {
      print('Nama Fitur boleh Kosong!');
      return;
    }

    /// Penamaan feature
    String moduleNameSnakeCase = DataConverter.camelCaseToSnakeCase(
      featureName,
    );
    String featuresPath = "$modulesPath$moduleNameSnakeCase/";

    /// Path Folder
    String controllerPath = '${featuresPath}controllers/';
    String constantsPath = '${featuresPath}constants/';
    String modelPath = '${featuresPath}models/';
    String bindingPath = "${featuresPath}bindings/";
    String repositoryPath = '${featuresPath}repositories/';
    String viewFolder = '${featuresPath}view/';
    String uiFolder = '${viewFolder}ui/';
    String componentsFolder = '${viewFolder}components/';

    /// * Create Constant File
    file(
      name: '$constantsPath${moduleNameSnakeCase}_assets_constant.dart',
      content: GeneratorModuleData.assets(
        nameFeature: featureName,
      ),
    );
    file(
      name: '$constantsPath${moduleNameSnakeCase}_api_constant.dart',
      content: GeneratorModuleData.api(
        nameFeature: featureName,
      ),
    );

    /// * Create Controller File
    file(
      name: '$controllerPath${moduleNameSnakeCase}_controller.dart',
      content: GeneratorModuleData.controller(
        nameFeature: featureName,
      ),
    );

    /// * Create Binding File
    file(
      name: '$bindingPath${moduleNameSnakeCase}_binding.dart',
      content: GeneratorModuleData.binding(
        controllerPath: controllerPath,
        nameFeature: featureName,
        nameClassScreen: featureName,
      ),
    );

    /// * Create Repo File
    file(
      name: '$repositoryPath${moduleNameSnakeCase}_repository.dart',
      content: GeneratorModuleData.repository(
        constantPath: constantsPath,
        nameFeature: featureName,
        nameClassScreen: featureName,
      ),
    );

    /// * Create UI File
    file(
      name: '$uiFolder${moduleNameSnakeCase}_screen.dart',
      content: GeneratorModuleData.screen(
        constantPath: constantsPath,
        nameFeature: featureName,
        nameClassScreen: featureName,
      ),
    );

    /// * Create Components File
    file(
      name: '$componentsFolder.gitkeep',
    );

    /// * Create Model File
    file(
      name: '$modelPath.gitkeep',
    );

    /// * Update Navigation
    updateNavigation(
      name: featureName,
    );
  }

  static void createSubFeature() {
    String? resInputFeature = InputUser.inputFeature();
    if (resInputFeature == null) return;
    print('Inputkan Nama Sub Fitur : (Format UpperCamelCase Contoh: SingIn)');
    String? featureName = stdin.readLineSync();
    if (featureName == null || featureName.isEmpty) {
      print('Nama Fitur boleh Kosong!');
      return;
    }

    /// Penamaan feature
    String moduleNamePascalCase = DataConverter.snakeCaseToPascalCase(
      resInputFeature,
    );
    String moduleNameSnakeCase = DataConverter.camelCaseToSnakeCase(
      featureName,
    );

    String featuresPath =
        "$modulesPath$resInputFeature/sub_features/$moduleNameSnakeCase/";
    String featuresConstPath = "$modulesPath$resInputFeature/";

    /// Path Folder
    String constantsPath = '${featuresConstPath}constants/';
    String controllerPath = '${featuresPath}controllers/';
    String modelPath = '${featuresPath}models/';
    String repositoryPath = '${featuresPath}repositories/';
    String viewFolder = '${featuresPath}view/';
    String uiFolder = '${viewFolder}ui/';
    String componentsFolder = '${viewFolder}components/';

    /// * Create Controller File
    file(
      name:
          '$controllerPath${resInputFeature}_${moduleNameSnakeCase}_controller.dart',
      content: GeneratorModuleData.controller(
        nameFeature: "$moduleNamePascalCase$featureName",
      ),
    );

    /// * Create Repo File
    file(
      name: '$repositoryPath${moduleNameSnakeCase}_repository.dart',
      content: GeneratorModuleData.repository(
        constantPath: constantsPath,
        nameFeature: moduleNamePascalCase,
        nameClassScreen: featureName,
      ),
    );

    /// * Create UI File
    file(
      name: '$uiFolder${moduleNameSnakeCase}_screen.dart',
      content: GeneratorModuleData.screen(
        constantPath: constantsPath,
        nameFeature: moduleNamePascalCase,
        nameClassScreen: featureName,
      ),
    );

    /// * Create Components File
    file(
      name: '$componentsFolder.gitkeep',
    );

    /// * Create Model File
    file(
      name: '$modelPath.gitkeep',
    );

    /// * Update Navigation
    updateNavigation(
      name: "$moduleNamePascalCase$featureName",
    );
  }

  static Future<Directory> folder(String name) async {
    return await Directory(name).create(recursive: true);
  }

  static Future<void> file({
    required String name,
    String content = '',
  }) async {
    var temp = File(name);
    temp.createSync(recursive: true);
    if (content.isEmpty) return;
    temp.writeAsStringSync(content);
  }

  static Future<void> updateNavigation({
    required String name,
  }) async {
    String pascalCaseToCamelCase = DataConverter.pascalCaseToCamelCase(name);
    String camelCaseToSnakeCase = DataConverter.camelCaseToSnakeCase(name);

    var route = File("${configsPath}routes/route.dart");

    var readDataRoute = await route.readAsString();

    var contentRoute = readDataRoute.replaceAll("}",
        "static const String ${pascalCaseToCamelCase}Route = '/$camelCaseToSnakeCase';\n}");
    route.writeAsStringSync(contentRoute);
  }
}

class InputUser {
  static String input() {
    String? result = stdin.readLineSync();
    if (result == null || result.isEmpty) {
      print('Inputan Tidak Boleh Kosong');
    }
    return result ?? '';
  }

  static String? inputFeature() {
    /// Get All Feature
    print('\n--------------------List Fitur------------------------');
    List<String> listFeature = Directory(modulesPath)
        .listSync()
        .map((e) => e.path.split('/').last)
        .toList();
    listFeature.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    int indexType = 0;
    for (var data in listFeature) {
      print('$indexType. $data');
      indexType++;
    }
    print('------------------------------------------------------\n');

    /// Input Index Feature
    print('Pilih Fitur sesuai dengan index:');
    String indexFeature = input();
    if (indexFeature.isEmpty) return null;
    int? tryParse = int.tryParse(indexFeature);
    if (tryParse == null) {
      return null;
    }

    if (tryParse >= listFeature.length) {
      print('Index yang diinputkan tidak ditemukan');
      return null;
    }
    return listFeature[tryParse];
  }
}

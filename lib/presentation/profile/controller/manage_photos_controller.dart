

import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class ManagePhotosController extends GetxController {
  final selectedType = 0.obs;

  final profileImage = Rx<File?>(null);
  final profileImages = <File>[].obs;
}

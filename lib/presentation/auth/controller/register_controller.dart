import 'package:madhya/core/exporters/app_export.dart';
import 'dart:io';

@lazySingleton
class RegisterController extends GetxController {
  final registerKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dobController = TextEditingController();

  final selectedGender = Rxn<String>();
  final selectedAge = Rxn<String>();
  final selectedReligion = Rxn<String>();
  final selectedCaste = Rxn<String>();
  final selectedSubCaste = Rxn<String>();

  final isTermsAccepted = false.obs;

  final profileImage = Rx<File?>(null);
  final profileImages = <File>[].obs;

  final ageList = ['10', '20', '30', '40'].obs;
  final religionList = ['Hindu', 'Christ', 'Muslim', 'Other'].obs;
  final casteList = ['Marathi', 'Other'].obs;
  final subCasteList = ['Marathi', 'Other'].obs;
}

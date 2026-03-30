import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class GlobalSearchController extends GetxController {
  // final lookingFor = RxnString();
  // final lookingList = ['Bride', 'Groom'];

  RxnString lookingFor = RxnString();
  RxnString religion = RxnString();
  RxnString caste = RxnString();

  RxnString heightFrom = RxnString();
  RxnString heightTo = RxnString();

  RxnString ageFrom = RxnString();
  RxnString ageTo = RxnString();

  List<String> lookingList = ['Bride', 'Groom'];
  List<String> religionList = ['Hindu', 'Muslim'];
  List<String> casteList = ['General', 'OBC'];

  List<String> heightList = List.generate(100, (i) => '${140 + i}');
  List<String> ageList = List.generate(50, (i) => '${18 + i}');
}

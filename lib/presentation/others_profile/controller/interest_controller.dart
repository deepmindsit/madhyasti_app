import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class InterestController extends GetxController {
  final interestList = [
    {
      'name': 'Pooja Kulkarni',
      'id': 'MDYST0150M',
      'msg':
          'We are interested in your profile, accept our proposal if you are interested',
      'isVerified': true,
      'isPremium': true,
      'status': '0',
    },
    {
      'name': 'Anjali Deshpande',
      'id': 'MDYST0125M',
      'msg': 'My family like your profile, please check and respond',
      'isVerified': true,
      'isPremium': false,
      'status': '1',
    },
    {
      'name': 'Sneha Patil',
      'id': 'MDYST0150M',
      'msg':
          'We are interested in your profile, accept our proposal if you are interested',
      'isVerified': true,
      'isPremium': true,
      'status': '2',
    },
    {
      'name': 'Rutuja Jadhav',
      'id': 'MDYST0150M',
      'msg':
          'I noticed my profile matches yours, please respond to this interest',
      'isVerified': false,
      'isPremium': false,
      'status': '3',
    },
  ].obs;
}

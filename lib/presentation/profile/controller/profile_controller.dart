

import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class ProfileController extends GetxController {
  final menuList = [
    {
      'title': 'Profile',
      'icon': HugeIcons.strokeRoundedUserCircle,
      'onTap': () => Get.toNamed(Routes.editProfile),
    },
    {
      'title': 'Partner Preference',
      'icon': HugeIcons.strokeRoundedUserLove02,
      'onTap': () => Get.toNamed(Routes.partnerPreference),
    },
    {
      'title': 'Manage Photos',
      'icon': HugeIcons.strokeRoundedAlbum02,
      'onTap': () => Get.toNamed(Routes.managePhotos),
    },
    {
      'title': 'Interests',
      'icon': HugeIcons.strokeRoundedHeartCheck,
      'onTap': () => Get.toNamed(Routes.interest),
    },
    {
      'title': 'Viewed',
      'icon': HugeIcons.strokeRoundedEye,
      'onTap': () => Get.toNamed(Routes.viewed),
    },
    {
      'title': 'Shortlist',
      'icon': HugeIcons.strokeRoundedStar,
      'onTap': () => Get.toNamed(Routes.shortList),
    },
    {'title': 'Packages', 'icon': HugeIcons.strokeRoundedCrown},
  ].obs;
  final profileImage = Rx<File?>(null);

  final otherMenu = [
    {'title': 'Settings', 'icon': HugeIcons.strokeRoundedSettings01},
    {'title': 'FAQ', 'icon': HugeIcons.strokeRoundedHelpSquare},
    {'title': 'Help and support', 'icon': HugeIcons.strokeRoundedMailOpen},
  ].obs;

  ///==============================Basic Details Edit======================
  final selectedAge = Rxn<String>();
  final ageList = ['10', '20', '30', '40'].obs;

  final selectedMStatus = Rxn<String>();
  final mStatusList = [
    'Never Married',
    'Married',
    'Widowed',
    'Awaiting Divorce',
    'Divorced',
  ].obs;

  final selectedHeight = Rxn<String>();
  final heightList = [
    '5ft 10in - 177 cms',
    '5ft 10in - 177 cms',
    '5ft 10in - 177 cms',
    '5ft 10in - 177 cms',
    '5ft 10in - 177 cms',
  ].obs;

  final selectedCreatedFor = Rxn<String>();
  final createdForList = ['Self', 'Son', 'Daughter', 'Brother'].obs;
}

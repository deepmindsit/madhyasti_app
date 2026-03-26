import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class ProfileController extends GetxController {
  final menuList = [
    {
      'title': 'Profile',
      'icon': HugeIcons.strokeRoundedUserCircle,
      'onTap': () => Get.toNamed(Routes.editProfile),
    },
    {'title': 'Partner Preference', 'icon': HugeIcons.strokeRoundedUserLove02},
    {'title': 'Manage Photos', 'icon': HugeIcons.strokeRoundedAlbum02},
    {'title': 'Contact Address', 'icon': HugeIcons.strokeRoundedLocation06},
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

  final otherMenu = [
    {'title': 'Settings', 'icon': HugeIcons.strokeRoundedSettings01},
    {'title': 'FAQ', 'icon': HugeIcons.strokeRoundedHelpSquare},
    {'title': 'Help and support', 'icon': HugeIcons.strokeRoundedMailOpen},
  ].obs;
}

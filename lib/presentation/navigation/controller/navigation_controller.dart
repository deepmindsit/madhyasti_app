import 'package:madhya/core/exporters/app_export.dart';

import '../../profile/view/profile_screen.dart';

@lazySingleton
class NavigationController extends GetxController {
  final currentIndex = 0.obs;

  static final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const MatchScreen(),
    const MailboxScreen(),
    const ProfileScreen(),
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

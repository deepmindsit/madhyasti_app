import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class NavigationController extends GetxController {
  final currentIndex = 0.obs;

  static final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const MatchScreen(),
    const Center(child: Text('Mailbox')),
    const Center(child: Text('Profile')),
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

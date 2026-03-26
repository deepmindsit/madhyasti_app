import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class OtherProfileController extends GetxController {
  final menuList = [
    {'title': '27 yrs', 'icon': HugeIcons.strokeRoundedParty},
    {'title': 'Hindu', 'icon': HugeIcons.strokeRoundedHandPrayer},
    {'title': 'Maratha', 'icon': HugeIcons.strokeRoundedStar},
    {'title': '5 ft 0 in – 152 cms', 'icon': HugeIcons.strokeRoundedRuler},
    {'title': 'Doctor', 'icon': HugeIcons.strokeRoundedBook01},
  ].obs;

  final List images = [
    'https://images.pexels.com/photos/36114638/pexels-photo-36114638.jpeg',
    'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
  ];

  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  final PageController pageController = PageController();

  final interestOptions = [
    InterestOptionModel(
      id: 1,
      text:
          'We are interested in your profile, accept our proposal if you are interested',
    ),
    InterestOptionModel(
      id: 2,
      text: 'My family like your profile, please check and respond',
    ),
    InterestOptionModel(
      id: 3,
      text:
          'I noticed my profile matches yours, please respond to this interest',
    ),
    InterestOptionModel(
      id: 4,
      text:
          "Our children's profile match, accept our message if you want us to contact you.",
    ),
  ];

  RxnInt selectedId = RxnInt();
}

class InterestOptionModel {
  final int id;
  final String text;

  InterestOptionModel({required this.id, required this.text});
}

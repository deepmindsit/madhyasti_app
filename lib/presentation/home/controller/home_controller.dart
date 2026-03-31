import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class HomeController extends GetxController {
  final HomeUsecase homeUsecase;
  HomeController(this.homeUsecase);
  final isLoading = false.obs;

  final sliderList = [].obs;

  @override
  void onInit() {
    super.onInit();
    _getHome();
  }

  Future<void> _getHome() async {
    try {
      final userid = await SecureStorageService.read('userId') ?? '';
      isLoading(true);
      final res = await homeUsecase.call(UserRequest(userid));

      if (res['common']['status'] == true) {
        final data = res['data'];
        sliderList.value = data['slider'];
      }
    } finally {
      isLoading(false);
    }
  }

  final statsData = [
    {"title": "Viewed\nYou", "value": "20", "icon": HugeIcons.strokeRoundedEye},
    {
      "title": "Interest Received",
      "value": "5",
      "icon": HugeIcons.strokeRoundedDownload05,
    },
    {
      "title": "Interest Accepted",
      "value": "3",
      "icon": HugeIcons.strokeRoundedThumbsUp,
    },
    {
      "title": "Address\nViewed",
      "value": "1",
      "icon": HugeIcons.strokeRoundedLocation01,
    },
  ].obs;

  final todayMatchList = [
    {
      'image':
          'https://images.pexels.com/photos/36114638/pexels-photo-36114638.jpeg',
      'details': {
        'name': 'Sneha Patil',
        'id': 'MDYST0123M',
        'age': '27 yrs ,Doctor',
        'address': 'Pune, Maharashtra',
      },
    },
    {
      'image':
          'https://images.pexels.com/photos/36226641/pexels-photo-36226641.jpeg',
      'details': {
        'name': 'Anjali Deshpande',
        'id': 'MDYST0123M',
        'age': '28 yrs ,Software Developer...',
        'address': 'Mumbai, Maharashtra',
      },
    },
  ].obs;

  final topMatchList = [
    {
      'details': {
        'image':
            'https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/19805/SM964729.jpg?date=Mon%20Mar%2023%202026%2017:48:41%20GMT+0530%20(India%20Standard%20Time)',
        'name': 'Sneha Patil',
        'id': 'MDYST0123M',
        // 'age': '27 yrs ,Doctor',
        'address': 'Pune, Maharashtra',
        'isVerified': false,
        'isPremium': false,
      },
    },
    {
      'details': {
        'image':
            'https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/18763/SM859820.jpg?date=Mon%20Mar%2023%202026%2017:46:49%20GMT+0530%20(India%20Standard%20Time)',
        'name': 'Kavya Joshi',
        'id': 'MDYST0123M',
        // 'age': '26 yrs ,Software Developer...',
        'address': 'Mumbai, Maharashtra',
        'isVerified': false,
        'isPremium': false,
      },
    },
    // https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/19805/SM964729.jpg?date=Mon%20Mar%2023%202026%2017:48:41%20GMT+0530%20(India%20Standard%20Time)
    // https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/19804/SM964550.jpg?date=Mon%20Mar%2023%202026%2017:49:06%20GMT+0530%20(India%20Standard%20Time)
  ].obs;

  final discStatData = [
    {
      "title": "39246\nMatches",
      "value": "Profession",
      "icon": HugeIcons.strokeRoundedBriefcase01,
    },
    {
      "title": "39246\nMatches",
      "value": "Education",
      "icon": HugeIcons.strokeRoundedMortarboard02,
    },
    {
      "title": "39246\nMatches",
      "value": "User Star",
      "icon": HugeIcons.strokeRoundedStar,
    },
    {
      "title": "39246\nMatches",
      "value": "City",
      "icon": HugeIcons.strokeRoundedLocation04,
    },
    {
      "title": "39246\nMatches",
      "value": "Religion",
      "icon": HugeIcons.strokeRoundedRotateLeft04,
    },
  ].obs;
}

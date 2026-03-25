import 'package:madhya/core/exporters/app_export.dart';

@lazySingleton
class ChatController extends GetxController {
  final chatList = [
    {
      "id": 1,
      "image":
          "https://s3.ap-south-1.amazonaws.com/awsimages.imagesbazaar.com/1200x1800-old/3263/SM108743.jpg?date=Wed%20Mar%2025%202026%2014:22:53%20GMT+0530%20(India%20Standard%20Time)",
      "name": "Pooja Kulkarni",
      "msg": "We are interested in your profile, accept ...",
      "time": '2025-02-10 14:30:00',
    },
    {
      "id": 2,
      "image": "",
      "name": "Anjali Deshpande",
      "msg": "My family like your profile, please check...",
      "time": '2026-03-25 10:30:00',
    },
  ].obs;

  final msgController = TextEditingController();

  final allMessages = [
    {
      "id": 5,
      "self": true,
      "message":
          "That's great to hear. I work as a Software Engineer in Pune. I enjoy travelling and spending time with family.",
      "created_at": '2026-03-25 10:30:00',
    },
    {
      "id": 4,
      "self": false,
      "message":
          "Yes, I enjoy teaching a lot. It’s something I’m really passionate about.",
      "created_at": '2026-03-25 10:30:00',
    },
    {
      "id": 3,
      "self": true,
      "message":
          "I'm good too. I noticed you're a teacher in Satara. That’s a wonderful profession.",
      "created_at": '2026-03-25 10:30:00',
    },
    {
      "id": 2,
      "self": false,
      "message":
          "Hello Rohan, thank you for reaching out. I'm doing well. How are you?",
      "created_at": '2026-03-25 10:30:00',
    },
    {
      "id": 1,
      "self": true,
      "message":
          "Hi Pooja, I came across your profile and found it interesting. Hope you're doing well.",
      "created_at": '2025-02-10 14:30:00',
    },
  ].obs;
}

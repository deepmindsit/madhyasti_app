import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:madhya/core/exporters/app_export.dart';

class AllDialogs {
  // void noInternetDialog() {
  //   Get.dialog(
  //     PopScope(
  //       canPop: false,
  //       child: AlertDialog(
  //         surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
  //         backgroundColor: Theme.of(Get.context!).cardColor,
  //         title: const Text(
  //           'No Internet Connection',
  //           style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Image.asset(Images.noInternet, width: Get.height * 0.25.w),
  //             const SizedBox(height: 12),
  //             Text(
  //               'Please check your internet connection.',
  //               style: TextStyle(color: inverseColor),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  //             onPressed: () async {
  //               Get.offAllNamed(Routes.splash);
  //             },
  //             child: Text('Retry', style: TextStyle(color: Colors.white)),
  //           ),
  //         ],
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  // }

  void changeNumber(String number) {
    if (Platform.isIOS) {
      // iOS style dialog
      showCupertinoDialog(
        context: Get.context!,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text('Change Number'),
          content: Text('Are you sure you want to change\n+91 $number'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(ctx),
              isDestructiveAction: true,
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                getIt<AuthController>().numberController.clear();
                Get.offAllNamed(Routes.login);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    } else {
      // Android style dialog
      Get.dialog(
        AlertDialog(
          surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          content: Text('Are you sure you want to change\n+91 $number'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('No', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                getIt<AuthController>().numberController.clear();
                Get.offAllNamed(Routes.login);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }
  }



  void showConfirmationDialog(
    String title,
    String message, {
    required VoidCallback onConfirm,
  }) {
    Get.dialog(
      Dialog(
        surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 50.sp,
                color: Colors.redAccent,
              ),
              SizedBox(height: 10.h),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(Get.context!).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: onConfirm,
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}


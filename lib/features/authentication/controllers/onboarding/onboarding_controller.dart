import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  /// Variables
  /// 
  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;
  /// Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }
  /// Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 3){
      final storage = GetStorage();
      if(kDebugMode) {
        print('==================== GET STORAGE =====================');
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
  /// Update Current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 3;
    pageController.jumpToPage(3);
  }
}
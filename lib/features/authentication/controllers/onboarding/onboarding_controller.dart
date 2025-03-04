import 'package:my_house/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump To The specific dot selected Page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///Update current index and jump to next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // final storage = GetStorage();
      // storage.write('IsFirstTime', false);

      Get.offAll(() => const LoginScreen());
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  ///Update current index and jump to the last Page
  void skipPage() {
    // final storage = GetStorage();
    // storage.write('IsFirstTime', false);

    Get.offAll(
      () => const LoginScreen(),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    // currentPageIndex.value = 2;
    // pageController.jumpToPage(2);
  }
}

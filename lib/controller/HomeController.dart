import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.until((route) => route.isFirst);
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
    }
  }
}

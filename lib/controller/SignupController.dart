import 'package:food_application/screens/home/HomeView.dart';
import 'package:food_application/screens/startup/Loginview.dart';
import 'package:get/get.dart';


class SignupController extends GetxController {
  void navigateToHome() {
    Get.to(() => HomeView());
  }

  void navigateToLogin() {
    Get.to(() => LoginView());
  }

  void signup() {
    navigateToHome();
  }
}

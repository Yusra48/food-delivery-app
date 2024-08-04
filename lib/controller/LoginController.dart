import 'package:food_application/screens/home/HomeView.dart';
import 'package:food_application/screens/startup/SignupView.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  void navigateToHome() {
    Get.to(() => HomeView());
  }

  void navigateToSignup() {

    Get.to(() => SignupView());
  }

  void login(String email, String password) {
    Get.to(() => HomeView());
  }
}

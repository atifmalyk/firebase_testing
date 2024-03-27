import 'package:firebase_demo/app/services/splash_swervices.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
SplashServices splashScreen=SplashServices();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    splashScreen.isLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  //TODO: Implement ForgetPasswordController
late final TextEditingController emailController;
final auth=FirebaseAuth.instance;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController=TextEditingController();
  }

  resetPassword(){
    auth.sendPasswordResetEmail(email: emailController.text).then((value) {
      Utils().getErrorMessage("Success");
    }).onError((error, stackTrace) {
      Utils().getErrorMessage(error.toString());
    });
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

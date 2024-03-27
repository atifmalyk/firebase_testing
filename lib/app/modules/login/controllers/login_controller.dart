import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final FirebaseAuth auth;
  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
    // You can initialize anything here when the controller is first created
  }

  @override
  void onReady() {
    super.onReady();
    // You can perform actions here when the widget is fully rendered on the screen
  }

  @override
  void onClose() {
    super.onClose();
    // You can dispose of resources here when the controller is no longer needed
  }

  @override
  void dispose() {
    // This method is called automatically by GetX when the controller is disposed.
    // You can dispose of resources here, such as closing streams or cancelling subscriptions.
    super.dispose();
  }

  void login() async {
    // Implement your login logic here
    String email = emailController.text;
    String password = passwordController.text;

    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils().getErrorMessage("Login Successfully");
      Get.toNamed(Routes.HOME);
    }).catchError((error) {
      Utils().getErrorMessage(error.message);
    });

    print('Email: $email, Password: $password');
  }
}

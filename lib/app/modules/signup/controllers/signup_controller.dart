import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/verify_mobile_number_view.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  late final FirebaseAuth auth;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController verifyController = TextEditingController();

  void signup() {
    // Implement your signup logic here
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils().getErrorMessage("User Registered Successfully");
    }).catchError((error) {
      Utils().getErrorMessage(error.message);
    });
    // Example: Register user with email and password
    print('Email: $email, Password: $password');
  }

  void signupWithMobileNumber() {
    // Implement your signup logic here
    auth
        .verifyPhoneNumber(
            phoneNumber: mobileNumberController.text,
            verificationCompleted: (_) {},
            verificationFailed: (e) {
              Utils().getErrorMessage(e.toString());
            },
            codeSent: (String verificationID, int? token) {
              Get.to(() => VerifyMobileNumberView(
                    verificationCode: verificationID,
                  ));
            },
            codeAutoRetrievalTimeout: (e) {
              Utils().getErrorMessage(e.toString());
            })
        .catchError((error) {
      Utils().getErrorMessage(error.message);
    });
  }

  void verifyMobileNumber() {}
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

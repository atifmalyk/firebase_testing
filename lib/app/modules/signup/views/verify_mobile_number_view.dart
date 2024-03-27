import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/app/modules/home/controllers/home_controller.dart';
import 'package:firebase_demo/app/modules/home/views/home_view.dart';
import 'package:firebase_demo/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VerifyMobileNumberView extends GetView<SignupController> {
  final String verificationCode;

  const VerifyMobileNumberView({required this.verificationCode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup with mobile'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: controller.mobileNumberController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final credentials = PhoneAuthProvider.credential(
                    verificationId: verificationCode,
                    smsCode: controller.verifyController.text);

                try {
                  controller.auth.signInWithCredential(credentials);
                  Get.to(() => HomeView());
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}

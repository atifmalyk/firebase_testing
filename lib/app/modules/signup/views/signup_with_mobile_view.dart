import 'package:firebase_demo/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupWithMobileView extends GetView<SignupController> {
  const SignupWithMobileView({Key? key}) : super(key: key);
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
                labelText: 'Enter Mobile Number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: controller.signupWithMobileNumber,
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}

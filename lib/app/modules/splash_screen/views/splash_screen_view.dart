import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.splashScreen.isLogin();
    return Scaffold(
      body: const Center(
        child: Text(
          'SplashScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SplashServices {
  void isLogin() {
    FirebaseAuth auth=FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3), () {
        Get.toNamed(Routes.HOME);
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Get.toNamed(Routes.LOGIN);
      });
    }


  }
}

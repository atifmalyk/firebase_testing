import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
 late FirebaseAuth auth;
  @override
  void onInit() {
    super.onInit();
    auth=FirebaseAuth.instance;

  }
void logout(){
    auth.signOut().then((value){
      Get.toNamed(Routes.LOGIN);
      Utils().getErrorMessage("Logged out successfully");
   }).catchError((error){
     print(error.message ?? "Something went wrong");
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final ref = FirebaseDatabase.instance.ref('Title');
  final count = 0.obs;
 late FirebaseAuth auth;
  var dataList = [].obs;
  @override
  void onInit() {
    super.onInit();
    auth=FirebaseAuth.instance;
    listenForUpdates();

  }
  void listenForUpdates() {
    ref.onValue.listen((event) {
      var data = event.snapshot.value;
      if (data != null) {
        if (data is Map) {
          dataList.assignAll(data.values.toList());
        } else {
          // Handle other data types if necessary
        }
      } else {
        dataList.clear();
      }
    }, onError: (error) {
      print("Failed to listen for updates: $error");
    });
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

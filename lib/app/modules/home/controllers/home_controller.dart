import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final ref = FirebaseDatabase.instance.ref('Title');
  final count = 0.obs;
  late FirebaseAuth auth;
  var dataList = [].obs;
  late final TextEditingController searchController;

  var searchText=''.obs;
  @override
  void onInit() {
    super.onInit();
    searchController=TextEditingController();
    auth = FirebaseAuth.instance;
    listenForUpdates();
  }

  void listenForUpdates() {
    ref.onValue.listen((event) {
      //data is received in snapshot
      //snapshot.value is used to take the values of the data
      var data = event.snapshot.value;
      if (data != null) {
        //since the data is stored in key values payers in realtime database
        //so it is checked first whether it is map?
        //if it is then the values are fetched then converted and added to the list
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
void filterList(value){

}

  void logout() {
    auth.signOut().then((value) {
      Get.toNamed(Routes.LOGIN);
      Utils().getErrorMessage("Logged out successfully");
    }).catchError((error) {
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

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  //TODO: Implement AddPostController

  RxBool isLoading=false.obs;
  final databaseRef=FirebaseDatabase.instance.ref('Title');
  late final TextEditingController textEditingController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    textEditingController=TextEditingController();
  }
  void addPost(){
    var id=DateTime.now().microsecond.toString();
   databaseRef.child(id).set({
     'title':textEditingController.text.toString(),
      'id': id
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

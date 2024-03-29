import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPostFirestoreController extends GetxController {
  //TODO: Implement AddPostFirestoreController

  RxBool isLoading=false.obs;
  final firestore=FirebaseFirestore.instance.collection("users");
  late final TextEditingController postController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    postController=TextEditingController();
  }
  void addPost(){
    var id=DateTime.now().microsecond.toString();
    firestore.doc(id).set({
      'title':postController.text.toString(),
      'id': id
    }).then((value) {

    }).onError((error, stackTrace) {

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

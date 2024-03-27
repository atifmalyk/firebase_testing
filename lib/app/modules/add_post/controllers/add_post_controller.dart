import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  //TODO: Implement AddPostController

  RxBool isLoading=false.obs;

  final databaseRef=FirebaseDatabase.instance.ref('Post');
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

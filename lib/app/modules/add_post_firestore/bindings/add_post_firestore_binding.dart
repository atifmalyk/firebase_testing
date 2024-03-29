import 'package:get/get.dart';

import '../controllers/add_post_firestore_controller.dart';

class AddPostFirestoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostFirestoreController>(
      () => AddPostFirestoreController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/firestore_list_screen_controller.dart';

class FirestoreListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirestoreListScreenController>(
      () => FirestoreListScreenController(),
    );
  }
}

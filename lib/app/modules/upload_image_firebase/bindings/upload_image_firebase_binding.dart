import 'package:get/get.dart';

import '../controllers/upload_image_firebase_controller.dart';

class UploadImageFirebaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadImageFirebaseController>(
      () => UploadImageFirebaseController(),
    );
  }
}

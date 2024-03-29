import 'dart:html';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageFirebaseController extends GetxController {
  //TODO: Implement UploadImageFirebaseController
XFile? image;
final picker =ImagePicker();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
getImageFromGallery() async{
    final pickFile= await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(pickFile!=null){
      image=XFile(pickFile.path);
    }
    else{

    }
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

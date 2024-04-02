import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class UploadImageFirebaseController extends GetxController {
  XFile? image;
  ImagePicker picker = ImagePicker();
  final count = 0.obs;
  RxString imagePath=''.obs;


  FirebaseStorage firebaseStorage =FirebaseStorage.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref('Title');
  @override
  void onInit() {
    super.onInit();
  }

  getImageFromGallery() async {
    final pickFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickFile != null) {
      image = pickFile;
      imagePath.value=image!.path;
      update(); // Trigger UI update
    } else {
      // Handle case where user cancels image selection
    }
  }

  uploadImage() async {
    if (image != null) {
      Reference ref = FirebaseStorage.instance.ref('/foldername' + 'filename');
      UploadTask uploadTask = ref.putFile(File(image!.path));


      try{
        await Future.value(uploadTask);
      }
      catch(e){
        Utils().getErrorMessage(e.toString());
      }
      var newUrl = await ref.getDownloadURL(); // Await for the URL
      database.child('1').set({
        'id': '1212',
        'title': newUrl.toString()
      }).then((value) {
        Utils().getErrorMessage("Image Uploaded");
      }).onError((error, stackTrace) {
        // Handle error
      });
    } else {
      // Handle case where image is null
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

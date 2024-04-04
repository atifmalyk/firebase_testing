import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/app/services/firebase_notifications_service.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class UploadImageFirebaseController extends GetxController {


  final count = 0.obs;
  RxString imagePath=''.obs;
  // File? profilePic;
  Rx<File>? profilePic =Rx<File>(File(""));
NotificationServices notificationServices=NotificationServices();


  FirebaseStorage firebaseStorage =FirebaseStorage.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref('Title');
  @override
  void onInit() {
    super.onInit();
    notificationServices.requestNotificationsPermissions();
    notificationServices.getDeviceToken();
    notificationServices.isTokenRefreshed();

  }
  Future<void> hideAppIcon(String packageName) async {
    try {
      const platform = MethodChannel('app_icon_hider');
      await platform.invokeMethod('hideAppIcon', {"packageName": packageName});
    } on PlatformException catch (e) {
      print("Failed to hide app icon: '${e.message}'.");
    }
  }
  getImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image=await picker.pickImage(source: ImageSource.gallery);
    // final pickFile = await picker.pickImage(
    //   source: ImageSource.gallery,
    //   imageQuality: 80,
    // );

    if (image != null) {
      File convertedFile=File(image.path);
      profilePic?.value=convertedFile;
      update(); // Trigger UI update
    } else {
      // Handle case where user cancels image selection
    }
  }

  uploadImage() async {
    if (profilePic?.value!= null) {
      Reference ref = FirebaseStorage.instance.ref('/foldername').child('filename');
      UploadTask uploadTask = ref.putFile(profilePic!.value);
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

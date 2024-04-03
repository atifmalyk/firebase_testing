import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/upload_image_firebase_controller.dart';

class UploadImageFirebaseView extends GetView<UploadImageFirebaseController> {
  const UploadImageFirebaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadImageFirebaseView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                controller.getImageFromGallery();
              },
              child:Obx(() =>  Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 1
                  ),
                ),
                child: controller.profilePic?.value!=null
                    ? Image.file(controller.profilePic!.value)
                    : Icon(Icons.photo),
              )),
            ),
            ElevatedButton(onPressed: (){
              controller.uploadImage();
            }, child: Text("Upload Image"))
          ],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_firestore_controller.dart';

class AddPostFirestoreView extends GetView<AddPostFirestoreController> {
  const AddPostFirestoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fire Store data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.postController,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"What is in your mind",
                  label: Text("Add Firestore Data")
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              controller.addPost();

            }, child: Text("Add Post"))
          ],
        ),
      ),
    );
  }
}

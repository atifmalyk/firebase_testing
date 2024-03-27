import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  const AddPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPostView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"What is in your mind",
                label: Text("Add Post")
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){

            }, child: Text("Add Post"))
          ],
        ),
      ),
    );
  }
}

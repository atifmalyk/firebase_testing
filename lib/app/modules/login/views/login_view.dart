import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(

              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.login,
                  child: Text('Login'),
                ),
                SizedBox(width: 15,),
                ElevatedButton(
                  onPressed:(){
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text('Signup'),
                ),
              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Text("Forget Password ?"),
              onTap: (){
                Get.toNamed(Routes.FORGET_PASSWORD);

              },
            )
          ],
        ),
      ),
    );
  }
}

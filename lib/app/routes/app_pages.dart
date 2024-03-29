import 'package:get/get.dart';

import '../modules/add_post/bindings/add_post_binding.dart';
import '../modules/add_post/views/add_post_view.dart';
import '../modules/add_post_firestore/bindings/add_post_firestore_binding.dart';
import '../modules/add_post_firestore/views/add_post_firestore_view.dart';
import '../modules/firestore_list_screen/bindings/firestore_list_screen_binding.dart';
import '../modules/firestore_list_screen/views/firestore_list_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/upload_image_firebase/bindings/upload_image_firebase_binding.dart';
import '../modules/upload_image_firebase/views/upload_image_firebase_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.UPLOAD_IMAGE_FIREBASE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POST,
      page: () => const AddPostView(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: _Paths.FIRESTORE_LIST_SCREEN,
      page: () => const FirestoreListScreenView(),
      binding: FirestoreListScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POST_FIRESTORE,
      page: () => const AddPostFirestoreView(),
      binding: AddPostFirestoreBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_IMAGE_FIREBASE,
      page: () => const UploadImageFirebaseView(),
      binding: UploadImageFirebaseBinding(),
    ),
  ];
}

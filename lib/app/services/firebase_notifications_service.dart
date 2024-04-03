import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
FirebaseMessaging messaging=FirebaseMessaging.instance;

void requestNotificationsPermissions()async{
  NotificationSettings settings =await messaging.requestPermission(
    alert: true,
    provisional: true,
    badge: true,
    announcement: true,
    sound: true,
    carPlay: true,
    criticalAlert: true,
  );

  if(settings.authorizationStatus==AuthorizationStatus.authorized){
    print("Authorized");
  }
  else if(settings.authorizationStatus==AuthorizationStatus.provisional){

  }
  else {
    AppSettings.openAppSettings();
  }
}

}
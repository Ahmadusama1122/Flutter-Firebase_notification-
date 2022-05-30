import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notifications_firebase/notification_service/local_notification.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  @override
  void initstate(){
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
            (message) {
              print("Firebasemessaging.instance.getinitialmessage");
              if(message!=null){
                print("New Notification");
              }
            });
    FirebaseMessaging.onMessage.listen((message) {
      print("Firebasemessage.onMessage.listen");
      if(message.notification!=null){
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.detail ${message.data}");
        localNotification.createndisplaynotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("FirebaseMessaging.onMessageOpenedApp.listen");
      if(message.notification!=null){
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data22 ${message.data['_id']}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Text(
          'Push Notification'
        ),
      ),
    );
  }
}

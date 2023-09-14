import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../const/app_constants.dart';
import '../di/injection_container.dart';
import '../ui/theme/colors/app_color.dart';
import 'firebase_notification_data_source.dart';

class FirebaseNotificationDataSourceImpl
    implements FirebaseNotificationDataSource {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  FirebaseMessaging _firebaseMessaging = sl();
  int id = 0;

  ///Call initializeNotifications when you want to start listing for notification. eg. after user successful login
  @override
  void initializeNotifications({
    required Function onLaunch,
    required Function onLaunchWithoutNotification,
  }) async {
    ///Subscribe topics
    await subscribe();

    ///Request permissions
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    ///Request foreground permissions
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    ///Init local notification
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {},
        ),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse? payload) async {
        onLaunch();
      },
    );

    ///Foreground message listen
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage remoteMessage) async {
        RemoteNotification? notification = remoteMessage.notification;
        String? body, title;
        if(notification != null){
          if (Platform.isAndroid) {
            body = notification.body;
            title = notification.title;

            ///Show local notification
            showLocalNotification(
              title: title,
              body: body,
            );
          }
        }

        ///iOS will show notification by default if title and body received in notification parameter of RemoteMessage.
        ///if notification is not showing please remove the platform check condition and directly show notification using showLocalNotification method
      },
    );

    ///if the app has opened from a background state
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async => onLaunch(),
    );

    ///If the application has been opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          onLaunch();
        } else {
          onLaunchWithoutNotification();
        }
      },
    );

    /// Set a message handler function which is called when the app is in the
    /// background or terminated.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  ///Show local notification
  Future<void> showLocalNotification({
    String? body,
    String? title,
  }) async {
    id++;
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        NOTIFICATION_GROUP_CHANNEL_ID,
        NOTIFICATION_GROUP_CHANNEL_NAME,
        channelDescription: NOTIFICATION_GROUP_CHANNEL_DESCRIPTION,
        importance: Importance.max,
        priority: Priority.high,
        color: AppColor.primaryColor,
        icon: "@mipmap/ic_launcher",
        groupKey: NOTIFICATION_GROUP_KEY,
        setAsGroupSummary: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  @override
  Future subscribe() async {
    await _firebaseMessaging
        .subscribeToTopic(NOTIFICATION_GENERAL_TOPIC)
        .timeout(Duration(seconds: 5), onTimeout: () async {})
        .catchError((error, stackTrace) async {});
  }

  @override
  Future unSubscribe() async {
    await _firebaseMessaging
        .unsubscribeFromTopic(NOTIFICATION_GENERAL_TOPIC)
        .timeout(Duration(seconds: 5), onTimeout: () async {})
        .catchError((error, stackTrace) async {});
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  return Future<void>.value();
}

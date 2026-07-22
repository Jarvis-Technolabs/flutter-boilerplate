abstract class FirebaseNotificationDataSource {
  ///Call initializeNotifications when you want to start listing for notification. eg. after user successful login
  void initializeNotifications({
    required Function onLaunch,
    required Function onLaunchWithoutNotification,
  });

  ///Subscribe notification topic
  Future<void> subscribe();

  ///Unsubscribe notification topic
  Future<void> unSubscribe();
}

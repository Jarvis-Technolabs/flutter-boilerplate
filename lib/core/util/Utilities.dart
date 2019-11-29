
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';

const String CURRENT_APP_VERSION = 'currentAppVersion';
const double DUMMY_VERSION = 100.0;

class Utilities {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String getInitialsText(String displayName) {
    String name = '';
    if (displayName.isNotEmpty) {
      List<String> spliitedText = displayName.trim().split(" ");
      spliitedText.removeWhere((value) => value.toString().trim().length == 0);
      name = '${displayName[0]}';

      if (spliitedText.length > 0) {
        name = name + '${spliitedText[1][0]}';
      }
    }
    return name;
  }

  static Future<double> getAppLatestVersion() async {
    RemoteConfig remoteConfig = await RemoteConfig.instance;
    try {
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      remoteConfig.getString(CURRENT_APP_VERSION);
      double newVersion = double.parse(remoteConfig
          .getString(CURRENT_APP_VERSION)
          .trim()
          .replaceAll(".", "0"));
      return newVersion;
    } on FetchThrottledException catch (exception) {
      print(exception);
      return DUMMY_VERSION;
    } catch (exception) {
      print('Unable to fetch remote config');
      return DUMMY_VERSION;
    }
  }
}

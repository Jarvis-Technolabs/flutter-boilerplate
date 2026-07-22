import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:privacy_screen/privacy_screen.dart';

class SecureWidgetPage extends StatefulWidget {
  const SecureWidgetPage({super.key, required this.child});

  final Widget child;

  @override
  State<SecureWidgetPage> createState() => _SecureWidgetState();
}

class _SecureWidgetState extends State<SecureWidgetPage> {
  bool isAppInactive = false;
  StreamController<bool> refreshActiveState =
      StreamController<bool>.broadcast();

  bool screenPrivacy = true;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setPrivacyView(screenPrivacy);
    });
  }

  void setPrivacyView(bool isScreenBlur) async {
    if (isScreenBlur) {
      refreshActiveState.add(false);
      await PrivacyScreen.instance.enable(
        iosOptions: const PrivacyIosOptions(
          enablePrivacy: true,
          privacyImageName: "LaunchImage",
          autoLockAfterSeconds: 5,
          lockTrigger: IosLockTrigger.didEnterBackground,
        ),
        androidOptions: const PrivacyAndroidOptions(
          enableSecure: true,
          autoLockAfterSeconds: 5,
        ),
        backgroundColor: Colors.white.withOpacity(0),
        blurEffect: PrivacyBlurEffect.extraLight,
      );
    } else {
      WidgetsBinding.instance
          .addObserver(LifecycleEventHandler(resumeCallBack: () async {
        // The app is now resumed, so let's change the value to false

        isAppInactive = false;
        refreshActiveState.add(false);
      }, suspendingCallBack: () async {
        // The app is now inactive, so let's change the value to true

        isAppInactive = true;
        refreshActiveState.add(true);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (screenPrivacy) {
      return widget.child;
    } else {
      return StreamBuilder<bool>(
          key: UniqueKey(),
          stream: refreshActiveState.stream,
          initialData: isAppInactive,
          builder: (_, snapshot) {
            return snapshot.data!
                ? ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: widget.child)
                : widget.child;
          });
    }
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
      case AppLifecycleState.inactive:
        await suspendingCallBack();
        break;
      case AppLifecycleState.paused:
        await suspendingCallBack();
        break;
      case AppLifecycleState.detached:
        await suspendingCallBack();
        break;
      case AppLifecycleState.hidden:
        await suspendingCallBack();
    }
  }
}

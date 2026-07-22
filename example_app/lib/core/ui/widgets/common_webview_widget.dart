import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../base/screen/base_screen.dart';
import 'loading_indicator.dart';

class CommonWebViewWidget extends BaseScreen {
  final String httpUrl;

  /// when we pass httpUrl at that time isHtmlContent is false else httpUrl is null and isHtmlContent is true and pass the htmlString parameter value

  CommonWebViewWidget({
    required this.httpUrl,
  });

  @override
  _CommonWebViewWidgetState createState() => _CommonWebViewWidgetState();
}

class _CommonWebViewWidgetState extends BaseScreenState<CommonWebViewWidget> {
  bool isLoading = true;
  StreamController<bool> webViewLoadingStreamController = StreamController();
  final _key = UniqueKey();

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            webViewLoadingStreamController.add(false);
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (UrlChange change) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {},
      )
      ..loadRequest(Uri.parse(widget.httpUrl!));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
  }

  @override
  void dispose() {
    webViewLoadingStreamController.close();
    super.dispose();
  }

  @override
  Widget body(BuildContext context) => Stack(
        children: [
          WebViewWidget(controller: _controller),

          /// Show progress indicator while webview content is loading
          StreamBuilder<bool>(
              stream: webViewLoadingStreamController.stream,
              initialData: true,
              builder: (context, snapshot) {
                bool isLoading = snapshot.data ?? true;
                return isLoading
                    ? CommonCircularProgressIndicator(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      )
                    : SizedBox.shrink();
              })
        ],
      );
}

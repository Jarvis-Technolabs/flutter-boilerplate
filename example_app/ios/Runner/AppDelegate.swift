import UIKit
import Flutter
import flutter_downloader

/*To set the map key please uncomment the below code*/
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let jailBreakChannelName = "jailBreakChannel"
    private let checkJailbreakMethod = "checkJailbreak"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        /*To set the map key please uncomment the below code*/
        #if PROD
           GMSServices.provideAPIKey("AIzaSyD6DCpz7gh1QexinwRdqCc6hNfMQM1kU90")
        #else
           GMSServices.provideAPIKey("AIzaSyD6DCpz7gh1QexinwRdqCc6hNfMQM1kU90")
        #endif

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

        let jailBreakChannel = FlutterMethodChannel(name: jailBreakChannelName,
                                                    binaryMessenger: controller.binaryMessenger)
        jailBreakChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == self.checkJailbreakMethod else {
                result(FlutterMethodNotImplemented)
                return
            }
            result(UIDevice.current.isJailBroken)
        })
        FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
       

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

private func registerPlugins(registry: FlutterPluginRegistry) {
    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
        FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
    }
}

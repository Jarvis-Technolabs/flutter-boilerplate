import UIKit
import Flutter
/*To set the map key please uncomment the below code*/
// import GoogleMaps

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
      /*  #if PROD
           GMSServices.provideAPIKey("Prod flavour map key")
        #else
           GMSServices.provideAPIKey("Other flavour map key")
        #endif */

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
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

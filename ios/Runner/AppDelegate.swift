import UIKit
import Flutter
/*To set the map key please uncomment the below code*/
// import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
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

        let jailBreakChannel = FlutterMethodChannel(name: "jailBreakChannel",
                                                    binaryMessenger: controller.binaryMessenger)
        jailBreakChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            result(UIDevice.current.isJailBroken)
        })
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

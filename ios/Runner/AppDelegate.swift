import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let apiKeyChannel = FlutterMethodChannel(name: "com.example.moniepoint_test/apiKey", binaryMessenger: controller.binaryMessenger)

    apiKeyChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "setApiKey", let args = call.arguments as? [String: Any], let apiKey = args["apiKey"] as? String {
        GMSServices.provideAPIKey(apiKey)
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

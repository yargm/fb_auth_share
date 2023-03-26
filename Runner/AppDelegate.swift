import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      //inicializa metodo shared
     // ApplicationDelegate.shared.application(
       // application, didFinishLaunchingWithOptions: launchOptions
      //)
      // EXTRA
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let channleName = "shareChannel"
      let channelFlutter = FlutterMethodChannel(
        name: channleName,
        binaryMessenger: controller.binaryMessenger)
      
      channelFlutter.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method
          {
          case "shareOnFacebook":
              guard let args = call.arguments else {
                              result(false)
                              break
                          }
                          if let myArgs = args as? [String: Any],
                             let quote = myArgs["quote"] as? String,
                             let url = myArgs["url"] as? String
                          {
                              //aqui se supone deberia ir la accion de compartir
                              result(quote)
                          }
              
          default: result(FlutterMethodNotImplemented)
          }
      })
      // EXTRA
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

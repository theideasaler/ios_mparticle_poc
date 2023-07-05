import UIKit
import Flutter
import mParticle_Apple_SDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let mParticleOptions = MParticleOptions(key: "your_key", secret: "your_secret")
    mParticleOptions.proxyAppDelegate = false
    MParticle.sharedInstance().beginLocationTracking(kCLLocationAccuracyThreeKilometers, minDistance: 1000)
    MParticle.sharedInstance().backgroundLocationTracking = false
    MParticle.sharedInstance().start(with: mParticleOptions)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

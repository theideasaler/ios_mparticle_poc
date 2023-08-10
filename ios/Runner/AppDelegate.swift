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
    let mParticleOptions = MParticleOptions(key: "key", secret: "secret")
    mParticleOptions.proxyAppDelegate = false
    mParticleOptions.environment = MPEnvironment.development
    mParticleOptions.dataPlanId = "dataPlanId"
    mParticleOptions.dataPlanVersion = 1
    MParticle.sharedInstance().start(with: mParticleOptions)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Read Google Maps API key from configuration
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "googleMapsApiKey") as? String ?? ""
    
    // Only initialize Google Maps if we have a valid API key
    if !apiKey.isEmpty {
      GMSServices.provideAPIKey(apiKey)
      print("✅ Google Maps initialized successfully")
    } else {
      print("⚠️ Warning: Google Maps API key is missing or empty. Maps functionality will be disabled.")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
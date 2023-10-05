//
//  Best_PriceApp.swift
//  Best.Price
//
//  Created by Pawan Sharma on 22/09/23.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Best_PriceApp: App {
    // https://stackoverflow.com/a/62633158/1568609
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

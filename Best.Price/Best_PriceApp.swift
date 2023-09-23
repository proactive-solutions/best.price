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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

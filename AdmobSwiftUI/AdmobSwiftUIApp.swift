//
//  AdmobSwiftUIApp.swift
//  AdmobSwiftUI
//
//  Created by Nguyễn Linh on 13/06/2024.
//


import SwiftUI
import UIKit
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    return true
  }
}

@main
struct AdmobSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

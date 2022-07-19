//
//  iOSAppApp.swift
//  WatchApp WatchKit Extension
//
//  Created by Ditha Nurcahya Avianty on 19/07/22.
//

import SwiftUI

@main
struct iOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

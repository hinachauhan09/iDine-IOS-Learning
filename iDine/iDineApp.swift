//
//  iDineApp.swift
//  iDine
//
//  Created by Hina Chauhan on 16/09/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

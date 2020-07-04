//
//  HeMaApp.swift
//  Shared
//
//  Created by Shane Leigh on 02/07/2020.
//

import SwiftUI

@main
struct HeMaApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(order)
        }
    }
}

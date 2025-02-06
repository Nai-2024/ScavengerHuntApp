//
//  ScavengerHuntAppApp.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-06.
//

import SwiftUI

@main
struct ScavengerHuntAppApp: App {
    var body: some Scene {
        WindowGroup {
            CardsListView() // Start app with CardsListView instead of ContentView
        }
    }
}

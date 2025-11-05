//
//  Musik_ApApp.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 04/11/2025.
//

import SwiftUI

@main
struct Musik_ApApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Accueil", systemImage: "play.house.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person.circle.fill")
                    }
            }
        }
    }
}
